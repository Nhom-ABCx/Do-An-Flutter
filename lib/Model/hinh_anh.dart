import 'package:do_an_flutter/Model/base_model.dart';

class HinhAnh extends BaseModel<HinhAnh> {
  int? id;
  int? sanPhamId;
  String? hinhAnh;
  String? moTa;

  HinhAnh({this.id, this.sanPhamId, this.hinhAnh, this.moTa});

  @override
  HinhAnh fromJson(Map<String, dynamic> json) => HinhAnh(
     id : json['id'],
    sanPhamId : json['SanPhamId'],
    hinhAnh : json['HinhAnh'],
    moTa : json['MoTa'],
  );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['SanPhamId'] = sanPhamId;
    data['HinhAnh'] = hinhAnh;
    data['MoTa'] = moTa;
    return data;
  }
}
