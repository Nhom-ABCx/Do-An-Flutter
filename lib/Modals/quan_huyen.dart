import 'package:flutter_application_1/Modals/phuong_xa.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quan_huyen.g.dart';

//Chạy câu lệnh flutter pub run build_runner build trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.

class QuanHuyen {
  String? name;
  int? code;
  String? divisionType;
  String? codename;
  int? provinceCode;
  List<PhuongXa>? wards;

  QuanHuyen({this.name, this.code, this.divisionType, this.codename, this.provinceCode, this.wards});

  factory QuanHuyen.fromJson(dynamic json) => _$QuanHuyenFromJson(json);
  Map<String, dynamic> toJson() => _$QuanHuyenToJson(this);
}
