// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoa_don.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HoaDon _$HoaDonFromJson(Map<String, dynamic> json) => HoaDon(
      id: json['id'] as int,
      diaChiId: json['DiaChiId'] as int?,
      phuongThucThanhToan: json['PhuongThucThanhToan'] as int,
      tongSoLuong: json['TongSoLuong'] as int?,
      tongTien: (json['TongTien'] as num?)?.toDouble(),
      trangThai: int.parse(json['TrangThai']),
      createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at'] as String),
      ctHoaDon: (json['c_t__hoa_don'] as List).map((e) => CT_HoaDon.fromJson(e)).toList(),
    );

Map<String, dynamic> _$HoaDonToJson(HoaDon instance) => <String, dynamic>{
      'id': instance.id,
      'DiaChiId': instance.diaChiId,
      'PhuongThucThanhToan': instance.phuongThucThanhToan,
      'TongSoLuong': instance.tongSoLuong,
      'TongTien': instance.tongTien,
      'TrangThai': instance.trangThai,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
