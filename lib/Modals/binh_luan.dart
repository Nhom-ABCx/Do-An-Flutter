import 'package:json_annotation/json_annotation.dart';

part 'binh_luan.g.dart';

//Chạy câu lệnh flutter pub run build_runner watch trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson:true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.

class BinhLuan {
  int? id;
  String? noiDung;
  int? khachHangId;
  int? sanPhamId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String? userName;
  String? hoTen;
  String? hinhAnhKh;
  BinhLuan({
    this.id, 
    this.noiDung, 
    this.khachHangId, 
    this.sanPhamId, 
    this.createdAt, 
    this.updatedAt, 
    this.deletedAt,
    this.userName,
    this.hoTen,
    this.hinhAnhKh,
  });

  factory BinhLuan.fromJson(Map<String, dynamic> json) =>_$BinhLuanFromJson(json);
  Map<String, dynamic> toJson()=>_$BinhLuanToJson(this);

}
