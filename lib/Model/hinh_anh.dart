
class HinhAnh {
  int? id;
  int? sanPhamId;
  String? hinhAnh;

  HinhAnh({this.id, this.sanPhamId, this.hinhAnh});

  HinhAnh.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sanPhamId = json['SanPhamId'];
    hinhAnh = json['HinhAnh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['SanPhamId'] = sanPhamId;
    data['HinhAnh'] = hinhAnh;
    return data;
  }
}
