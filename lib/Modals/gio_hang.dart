import 'package:json_annotation/json_annotation.dart';

part 'gio_hang.g.dart';

//Chạy câu lệnh flutter pub run build_runner build trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.

class GioHang {
  int? id;
  int khachHangId;
  int sanPhamId;
  int soLuong;
  DateTime? createdAt;
  DateTime? updatedAt;

  GioHang({
    this.id,
    required this.khachHangId,
    required this.sanPhamId,
    required this.soLuong,
    this.createdAt,
    this.updatedAt,
  });

  factory GioHang.fromJson(dynamic json) => _$GioHangFromJson(json);
  Map<String, dynamic> toJson() => _$GioHangToJson(this);
}
