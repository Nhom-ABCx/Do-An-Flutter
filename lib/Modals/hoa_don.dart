import 'package:json_annotation/json_annotation.dart';

part 'hoa_don.g.dart';

//Chạy câu lệnh flutter pub run build_runner watch trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(
    explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.
class HoaDon {
  int? id;
  int? NhanVienId;
  late int KhachHangId;
  String? DiaChiGiao;
  int? TrangThai;
  double? TongTien;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  HoaDon(
      {this.id,
      this.NhanVienId,
      required this.KhachHangId,
      this.DiaChiGiao,
      this.TrangThai,
      this.TongTien,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});
  factory HoaDon.fromJson(dynamic json) => _$HoaDonFromJson(json);
  Map<String, dynamic> toJson() => _$HoaDonToJson(this);
}
