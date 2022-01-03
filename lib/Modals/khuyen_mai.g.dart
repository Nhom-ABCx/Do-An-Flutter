// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'khuyen_mai.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KhuyenMai _$KhuyenMaiFromJson(Map<String, dynamic> json) => KhuyenMai(
      chuongTrinhKhuyenMaiId: json['ChuongTrinhKhuyenMaiId'] as int?,
      sanPhamId: json['SanPhamId'] as int?,
      giamGia: json['GiamGia'] as int?,
      soLuong: json['SoLuong'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$KhuyenMaiToJson(KhuyenMai instance) => <String, dynamic>{
      'ChuongTrinhKhuyenMaiId': instance.chuongTrinhKhuyenMaiId,
      'SanPhamId': instance.sanPhamId,
      'GiamGia': instance.giamGia,
      'SoLuong': instance.soLuong,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
