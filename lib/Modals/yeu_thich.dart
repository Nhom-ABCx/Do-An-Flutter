import 'package:json_annotation/json_annotation.dart';

part 'yeu_thich.g.dart';

//Chạy câu lệnh flutter pub run build_runner build trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.

class YeuThich {
  int? id;
  int khachHangId;
  int sanPhamId;
  DateTime? createdAt;
  DateTime? updatedAt;

  YeuThich({
    this.id,
    required this.khachHangId,
    required this.sanPhamId,
    this.createdAt,
    this.updatedAt,
  });

  factory YeuThich.fromJson(dynamic json) => _$YeuThichFromJson(json);
  Map<String, dynamic> toJson() => _$YeuThichToJson(this);
}
