class CTSanPham {
  int? id;
  int? sanPhamId;
  String? maSanPham;
  int? soLuongTon;
  int? giaNhap;
  int? giaBan;
  List<String>? thuocTinhValue;
  int? trangThai;
  int? giamGia;

  CTSanPham({this.id, this.sanPhamId, this.maSanPham, this.soLuongTon, this.giaNhap, this.giaBan, this.thuocTinhValue, this.trangThai, this.giamGia});

  CTSanPham.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sanPhamId = json['SanPhamId'];
    maSanPham = json['MaSanPham'];
    soLuongTon = json['SoLuongTon'];
    giaNhap = json['GiaNhap'];
    giaBan = json['GiaBan'];
    thuocTinhValue = json['ThuocTinhValue'] != null ? List<String>.from((json['ThuocTinhValue'] as List).map((e) => e)) : null;
    trangThai = json['TrangThai'];
    giamGia = json['GiamGia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['SanPhamId'] = sanPhamId;
    data['MaSanPham'] = maSanPham;
    data['SoLuongTon'] = soLuongTon;
    data['GiaNhap'] = giaNhap;
    data['GiaBan'] = giaBan;
    data['ThuocTinhValue'] = thuocTinhValue;
    data['TrangThai'] = trangThai;
    data['GiamGia'] = giamGia;
    return data;
  }
}
