// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as int?,
      body: json['Body'] as String?,
      nhanVienId: json['NhanVienId'] as int?,
      khachHangId: json['KhachHangId'] as int?,
      conversationId: json['ConversationId'] as int?,
      createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'Body': instance.body,
      'NhanVienId': instance.nhanVienId,
      'KhachHangId': instance.khachHangId,
      'ConversationId': instance.conversationId,
      'created_at': instance.createdAt?.toIso8601String(),
    };
