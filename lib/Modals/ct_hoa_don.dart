// ignore_for_file: camel_case_types

import 'package:flutter_application_1/all_page.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ct_hoa_don.g.dart';

//Chạy câu lệnh flutter pub run build_runner watch trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.
class CT_HoaDon {
  int? id;
  int? hoaDonId;
  late int sanPhamId;
  int? soLuong;
  double? giaNhap;
  double? giaBan;
  double? giaGiam;
  double? thanhTien;
  int? star;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  SanPham sanPham;

  CT_HoaDon({
    this.id,
    this.hoaDonId,
    required this.sanPhamId,
    this.soLuong,
    this.giaNhap,
    this.giaBan,
    this.giaGiam,
    this.thanhTien,
    this.star,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.sanPham,
  });
  factory CT_HoaDon.fromJson(dynamic json) => _$CT_HoaDonFromJson(json);
  Map<String, dynamic> toJson() => _$CT_HoaDonToJson(this);
}
