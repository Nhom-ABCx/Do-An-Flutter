import 'package:json_annotation/json_annotation.dart';

part 'phuong_xa.g.dart';

//Chạy câu lệnh flutter pub run build_runner build trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.

class PhuongXa {
  String? name;
  int? code;
  String? codename;
  String? divisionType;
  String? shortCodename;

  PhuongXa({this.name, this.code, this.codename, this.divisionType, this.shortCodename});

  factory PhuongXa.fromJson(dynamic json) => _$PhuongXaFromJson(json);
  Map<String, dynamic> toJson() => _$PhuongXaToJson(this);
}
