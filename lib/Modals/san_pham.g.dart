// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'san_pham.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SanPham _$SanPhamFromJson(Map<String, dynamic> json) => SanPham(
      id: json['id'] as int?,
      tenSanPham: json['TenSanPham'] as String,
      moTa: json['MoTa'] as String?,
      soLuongTon: json['SoLuongTon'] as int?,
      giaNhap: json['GiaNhap'] as int?,
      giaBan: json['GiaBan'] as int?,
      hinhAnh: json['HinhAnh'] as String?,
      luotMua: json['LuotMua'] as int?,
      hangSanXuatId: json['HangSanXuatId'] as int?,
      loaiSanPhamId: json['LoaiSanPhamId'] as int?,
      createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$SanPhamToJson(SanPham instance) => <String, dynamic>{
      'id': instance.id,
      'TenSanPham': instance.tenSanPham,
      'MoTa': instance.moTa,
      'SoLuongTon': instance.soLuongTon,
      'GiaNhap': instance.giaNhap,
      'GiaBan': instance.giaBan,
      'HinhAnh': instance.hinhAnh,
      'LuotMua': instance.luotMua,
      'HangSanXuatId': instance.hangSanXuatId,
      'LoaiSanPhamId': instance.loaiSanPhamId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
