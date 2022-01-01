// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yeu_thich.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YeuThich _$YeuThichFromJson(Map<String, dynamic> json) => YeuThich(
      id: json['id'] as int?,
      khachHangId: json['KhachHangId'] as int,
      sanPhamId: json['SanPhamId'] as int,
      createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$YeuThichToJson(YeuThich instance) => <String, dynamic>{
      'id': instance.id,
      'KhachHangId': instance.khachHangId,
      'SanPhamId': instance.sanPhamId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
