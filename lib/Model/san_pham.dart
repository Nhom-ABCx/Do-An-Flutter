import 'package:do_an_flutter/Model/base_model.dart';
import 'package:do_an_flutter/Model/ct_san_pham.dart';
import 'package:do_an_flutter/Model/hinh_anh.dart';

class SanPham extends BaseModel<SanPham> {
  int? id;
  int? hangSanXuatId;
  int? loaiSanPhamId;
  String? tenSanPham;
  Map<String, dynamic>? thuocTinh;
  String? moTa;
  int? luotMua;
  List<String>? thuocTinhToHop;
  bool? trangThai;
  double? star;
  List<List<String>>? lstThuocTinhValue;
  List<CTSanPham>? cTSanPham;
  List<HinhAnh>? hinhAnh;

  SanPham(
      {this.id,
      this.hangSanXuatId,
      this.loaiSanPhamId,
      this.tenSanPham,
      this.thuocTinh,
      this.moTa,
      this.luotMua,
      this.thuocTinhToHop,
      this.trangThai,
      this.star,
      this.lstThuocTinhValue,
      this.cTSanPham,
      this.hinhAnh});

  @override
  SanPham fromJson(Map<String, dynamic> json) => SanPham(
        id: json['id'],
        hangSanXuatId: json['HangSanXuatId'],
        loaiSanPhamId: json['LoaiSanPhamId'],
        tenSanPham: json['TenSanPham'],
        thuocTinh: json['ThuocTinh'],
        moTa: json['MoTa'],
        luotMua: json['LuotMua'],
        thuocTinhToHop: json['ThuocTinhToHop'] != null ? List<String>.from((json['ThuocTinhToHop'] as List).map((e) => e)) : null,
        trangThai: json['TrangThai'] != 0 ? true : false,
        star: double.parse(json['Star'].toString()),
        lstThuocTinhValue: json['lstThuocTinhValue'] != null ? List.from((json['lstThuocTinhValue'] as List).map((e) => List<String>.from(e))) : null,
        cTSanPham: json['c_t__san_pham'] != null ? List<CTSanPham>.from((json['c_t__san_pham'] as List).map((e) => CTSanPham.fromJson(e))) : null,
        hinhAnh: json['hinh_anh'] != null ? List<HinhAnh>.from((json['hinh_anh'] as List).map((e) => HinhAnh().fromJson(e))) : null,
      );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['HangSanXuatId'] = hangSanXuatId;
    data['LoaiSanPhamId'] = loaiSanPhamId;
    data['TenSanPham'] = tenSanPham;
    data['ThuocTinh'] = thuocTinh!;
    data['MoTa'] = moTa;
    data['LuotMua'] = luotMua;
    data['ThuocTinhToHop'] = thuocTinhToHop;
    data['TrangThai'] = trangThai;
    data['Star'] = star;
    data['c_t__san_pham'] = cTSanPham != null ? cTSanPham!.map((v) => v.toJson()).toList() : null;
    data['hinh_anh'] = hinhAnh != null ? hinhAnh!.map((v) => v.toJson()).toList() : null;

    return data;
  }
}
