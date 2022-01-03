import 'package:flutter_application_1/Modals/quan_huyen.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tinh_thanhpho.g.dart';

//Chạy câu lệnh flutter pub run build_runner build trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.

class TinhThanhPho {
  String? name;
  int? code;
  String? divisionType;
  String? codename;
  int? phoneCode;
  List<QuanHuyen>? districts;

  TinhThanhPho({this.name, this.code, this.divisionType, this.codename, this.phoneCode, this.districts});

  factory TinhThanhPho.fromJson(dynamic json) => _$TinhThanhPhoFromJson(json);
  Map<String, dynamic> toJson() => _$TinhThanhPhoToJson(this);
}
