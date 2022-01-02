import 'package:flutter_application_1/all_page.dart';
import 'package:json_annotation/json_annotation.dart';

part 'san_pham.g.dart';

//Chạy câu lệnh flutter pub run build_runner watch trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.
class SanPham {
  int? id;
  String tenSanPham;
  String? moTa;
  int? soLuongTon;
  int? giaNhap;
  int? giaBan;
  String? hinhAnh;
  int? luotMua;
  int? hangSanXuatId;
  int? loaiSanPhamId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  SanPham({
    this.id,
    required this.tenSanPham,
    this.moTa,
    this.soLuongTon,
    this.giaNhap,
    this.giaBan,
    this.hinhAnh,
    this.luotMua,
    this.hangSanXuatId,
    this.loaiSanPhamId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  factory SanPham.fromJson(dynamic json) => _$SanPhamFromJson(json);
  Map<String, dynamic> toJson() => _$SanPhamToJson(this);
}
