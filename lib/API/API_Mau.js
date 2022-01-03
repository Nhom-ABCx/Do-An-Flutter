//https://provinces.open-api.vn
import ky from 'https://unpkg.com/ky/distribution/index.js'
import Alpine from 'https://unpkg.com/alpinejs@3.2.2/dist/module.esm.js'
import 'https://unpkg.com/superstruct/umd/superstruct.min.js'
const { object, number, string, array, record, defaulted, optional, size, mask, assign } = window.Superstruct

window.Alpine = Alpine

const SearchMatches = record(string(), size(array(number()), 2))

const Base = object({
  code: number(),
  name: string(),
  matches: optional(SearchMatches)
})

const Ward = Base

const District = assign(Base, object({
  wards: defaulted(array(Ward), [])
}))

const Province = assign(Base, object({
  districts: defaulted(array(District), [])
}))


/*
 * The Lunr engine consider each keyword optional, but in the context of
 * this demo, we want all keywords to be present.
 * This function is to prefix all keywords with plus ("+"),
 * ex: "Bà Rịa" -> "+Bà +Rịa".
 */
function markRequireAll(query) {
  const words = query.split(/\s+/)
  return words.map(w => `+${w}`).join(' ')
}

async function fetchProvinces(app) {
  const rdata = await ky.get('/api/p/').json()
  app.filteredProvinces = mask(rdata, array(Province))
}

async function fetchDistricts(provinceCode, app) {
  const rdata = await ky.get(`/api/p/${provinceCode}`, { searchParams: { depth: 2 } }).json()
  const province = mask(rdata, Province)
  app.filteredDistricts = province.districts
}

async function fetchWards(districtCode, app) {
  const rdata = await ky.get(`/api/d/${districtCode}`, { searchParams: { depth: 2 } }).json()
  const district = mask(rdata, District)
  app.filteredWards = district.wards
}

async function searchProvince(term, app) {
  if (app.selectedProvince && app.selectedProvince.name === term) {
    return
  }
  const rdata = await ky.get('/api/p/search/', {
    searchParams: { q: markRequireAll(term) }
  }).json()
  app.filteredProvinces = mask(rdata, array(Province))
}

async function searchDistrict(term, provinceCode, app) {
  if (app.selectedDistrict && app.selectedDistrict.name === term) {
    return
  }
  const rdata = await ky.get('/api/d/search/', {
    searchParams: { q: markRequireAll(term), p: provinceCode }
  }).json()
  app.filteredDistricts = mask(rdata, array(District))
}

async function searchWard(term, districtCode, app) {
  if (app.selectedWard && app.selectedWard.name === term) {
    return
  }
  const rdata = await ky.get('/api/w/search/', {
    searchParams: { q: markRequireAll(term), d: districtCode }
  }).json()
  app.filteredWards = mask(rdata, array(Ward))
}

Alpine.data('formApp', () => ({
  provinceSearch: '',
  provinceListShown: false,
  filteredProvinces: [],
  selectedProvince: null,
  districtSearch: '',
  districtListShown: false,
  filteredDistricts: [],
  selectedDistrict: null,
  wardSearch: '',
  wardListShown: false,
  filteredWards: [],
  selectedWard: null,

  async fetchProvinces() {
    fetchProvinces(this)
  },
  resetProvince() {
    this.provinceSearch = ''
    this.selectedProvince = null
    this.filteredProvinces = []
    this.provinceListShown = false
  },
  resetDistrict() {
    this.districtSearch = ''
    this.selectedDistrict = null
    this.filteredDistricts = []
    this.districtListShown = false
  },
  resetWard() {
    this.wardSearch = ''
    this.selectedWard = null
    this.filteredWards = []
    this.wardListShown = false
  },
  highlightName(item) {
    if (!item.matches) {
      return item.name
    }
    const name = item.name
    const matches = Object.values(item.matches)
    matches.sort((v1, v2) => v1[0] - v2[0])
    const parts = []
    var lastPos = 0
    for (const [s, e] of matches) {
      parts.push(name.slice(lastPos, s))
      parts.push(`<strong>${name.slice(s, e)}</strong>`)
      lastPos = e
    }
    parts.push(name.slice(lastPos))
    return parts.join('')
  },
  async startSearchingProvince() {
    this.provinceListShown = true
    if (!this.filteredProvinces.length) {
      fetchProvinces(this)
    }
  },
  async startSearchingDistrict() {
    this.districtListShown = true
    if (this.filteredDistricts.length || !this.selectedProvince) {
      return
    }
    await fetchDistricts(this.selectedProvince.code, this)
  },
  async searchDistrictOnTyping() {
    const term = this.districtSearch.trim()
      if (!term || !this.selectedProvince) {
        return
      }
    await searchDistrict(term, this.selectedProvince.code, this)
  },
  async startSearchingWard() {
    this.wardListShown = true
    if (this.filteredWards.length || !this.selectedDistrict) {
      return
    }
    await fetchWards(this.selectedDistrict.code, this)
  },
  selectProvince(province) {
    this.provinceListShown = false
    this.selectedProvince = province
    this.provinceSearch = province.name
    this.resetDistrict()
    this.resetWard()
  },
  selectDistrict(district) {
    this.districtListShown = false
    this.selectedDistrict = district
    this.districtSearch = district.name
    this.resetWard()
  },
  selectWard(ward) {
    this.wardListShown = false
    this.selectedWard = ward
    this.wardSearch = ward.name
  },
  async init() {
    this.$watch('provinceSearch', async (value) => {
      const term = value.trim()
      if (!term) {
        return
      }
      await searchProvince(value, this)
    })

    this.$watch('wardSearch', async (value) => {
      const term = value.trim()
      if (!term || !this.selectedDistrict) {
        return
      }
      await searchWard(value, this.selectedDistrict.code, this)
    })

    await fetchProvinces(this)
  }
}))
Alpine.start()