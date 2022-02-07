import 'package:flutter_application_1/Modals/ct_hoa_don.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hoa_don.g.dart';

//Chạy câu lệnh flutter pub run build_runner watch trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.
class HoaDon {
  int id;
  int? diaChiId;
  int? phuongThucThanhToan;
  int? tongSoLuong;
  double? tongTien;
  int? trangThai;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  List<CT_HoaDon> ctHoaDon;

  HoaDon({
    required this.id,
    this.diaChiId,
    this.phuongThucThanhToan,
    this.tongSoLuong,
    this.tongTien,
    this.trangThai,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.ctHoaDon,
  });
  factory HoaDon.fromJson(dynamic json) => _$HoaDonFromJson(json);
  Map<String, dynamic> toJson() => _$HoaDonToJson(this);
}
