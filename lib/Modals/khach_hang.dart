import 'package:json_annotation/json_annotation.dart';

part 'khach_hang.g.dart';

//Chạy câu lệnh flutter pub run build_runner watch trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(
    explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.
class KhachHang {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? matKhau;
  String hoTen;
  DateTime? ngaySinh;
  int? gioiTinh;
  String? diaChi;
  String? hinhAnh;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  KhachHang(
      {this.id,
      this.username,
      this.email,
      this.phone,
      this.matKhau,
      required this.hoTen,
      this.ngaySinh,
      this.gioiTinh,
      this.diaChi,
      this.hinhAnh,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});
  factory KhachHang.fromJson(dynamic json) => _$KhachHangFromJson(json);
  Map<String, dynamic> toJson() => _$KhachHangToJson(this);
}
