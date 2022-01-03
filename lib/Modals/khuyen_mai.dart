import 'package:json_annotation/json_annotation.dart';

part 'khuyen_mai.g.dart';

//Chạy câu lệnh flutter pub run build_runner watch trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.

class KhuyenMai {
  int? chuongTrinhKhuyenMaiId;
  int? sanPhamId;
  int? giamGia;
  int? soLuong;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  KhuyenMai({this.chuongTrinhKhuyenMaiId, this.sanPhamId, this.giamGia, this.soLuong, this.createdAt, this.updatedAt, this.deletedAt});

  factory KhuyenMai.fromJson(Map<String, dynamic> json) =>_$KhuyenMaiFromJson(json);

  Map<String, dynamic> toJson() =>_$KhuyenMaiToJson(this);
}
