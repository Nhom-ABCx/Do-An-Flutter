// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ct_hoa_don.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CT_HoaDon _$CT_HoaDonFromJson(Map<String, dynamic> json) => CT_HoaDon(
      HoaDonId: json['HoaDonId'] as int?,
      SanPhamId: json['SanPhamId'] as int,
      SoLuong: json['SoLuong'] as int?,
      GiaBan: (json['GiaBan'] as num?)?.toDouble(),
      GiaGiam: (json['GiaGiam'] as num?)?.toDouble(),
      ThanhTien: (json['ThanhTien'] as num?)?.toDouble(),
      Star: json['Star'] as int?,
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

Map<String, dynamic> _$CT_HoaDonToJson(CT_HoaDon instance) => <String, dynamic>{
      'HoaDonId': instance.HoaDonId,
      'SanPhamId': instance.SanPhamId,
      'SoLuong': instance.SoLuong,
      'GiaBan': instance.GiaBan,
      'GiaGiam': instance.GiaGiam,
      'ThanhTien': instance.ThanhTien,
      'Star': instance.Star,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
