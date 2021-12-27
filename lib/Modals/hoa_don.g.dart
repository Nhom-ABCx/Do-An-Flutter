// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoa_don.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HoaDon _$HoaDonFromJson(Map<String, dynamic> json) => HoaDon(
      id: json['id'] as int?,
      NhanVienId: json['NhanVienId'] as int?,
      KhachHangId: json['KhachHangId'] as int,
      DiaChiGiao: json['DiaChiGiao'] as String?,
      TrangThai: json['TrangThai'] as int?,
      TongTien: (json['TongTien'] as num?)?.toDouble(),
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

Map<String, dynamic> _$HoaDonToJson(HoaDon instance) => <String, dynamic>{
      'id': instance.id,
      'NhanVienId': instance.NhanVienId,
      'KhachHangId': instance.KhachHangId,
      'DiaChiGiao': instance.DiaChiGiao,
      'TrangThai': instance.TrangThai,
      'TongTien': instance.TongTien,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
