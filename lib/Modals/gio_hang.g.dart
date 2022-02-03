// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gio_hang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GioHang _$GioHangFromJson(Map<String, dynamic> json) => GioHang(
      id: json['id'] as int?,
      khachHangId: json['KhachHangId'] as int,
      sanPhamId: json['SanPhamId'] as int,
      soLuong: json['SoLuong'] as int,
      createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$GioHangToJson(GioHang instance) => <String, dynamic>{
      'id': instance.id,
      'KhachHangId': instance.khachHangId,
      'SanPhamId': instance.sanPhamId,
      'SoLuong': instance.soLuong,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
