import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

//Chạy câu lệnh flutter pub run build_runner build trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.
class Message {
  int? id;
  String? body;
  int? nhanVienId;
  int? khachHangId;
  int? conversationId;
  DateTime? createdAt;

  Message({
    this.id,
    this.body,
    this.nhanVienId,
    this.khachHangId,
    this.conversationId,
    this.createdAt,
  });
  factory Message.fromJson(dynamic json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
