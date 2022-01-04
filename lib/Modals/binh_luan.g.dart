// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binh_luan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BinhLuan _$BinhLuanFromJson(Map<String, dynamic> json) => BinhLuan(
      id: json['id'] as int?,
      noiDung: json['NoiDung'] as String?,
      khachHangId: json['KhachHangId'] as int?,
      sanPhamId: json['SanPhamId'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      userName: json['Username'] as String?,
      hoTen: json['HoTen'] as String?,
      hinhAnhKh: json['HinhAnh'] as String?
    );

Map<String, dynamic> _$BinhLuanToJson(BinhLuan instance) => <String, dynamic>{
      'id': instance.id,
      'NoiDung': instance.noiDung,
      'KhachHangId': instance.khachHangId,
      'SanPhamId': instance.sanPhamId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'Username':instance.userName,
      'HoTen':instance.hoTen,
      'HinhAnh':instance.hinhAnhKh,
    };
