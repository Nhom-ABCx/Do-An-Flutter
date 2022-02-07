// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ct_hoa_don.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CT_HoaDon _$CT_HoaDonFromJson(Map<String, dynamic> json) => CT_HoaDon(
    id: json["id"] as int?,
    hoaDonId: json['HoaDonId'] as int?,
    sanPhamId: json['SanPhamId'] as int,
    soLuong: json['SoLuong'] as int?,
    giaNhap: (json['GiaNhap'] as num?)?.toDouble(),
    giaBan: (json['GiaBan'] as num?)?.toDouble(),
    giaGiam: (json['GiaGiam'] as num?)?.toDouble(),
    thanhTien: (json['ThanhTien'] as num?)?.toDouble(),
    star: json['Star'] as int?,
    createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
    deletedAt: json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at'] as String),
    sanPham: SanPham.fromJson(json['san_pham']));

Map<String, dynamic> _$CT_HoaDonToJson(CT_HoaDon instance) => <String, dynamic>{
      "id": instance.id,
      'HoaDonId': instance.hoaDonId,
      'SanPhamId': instance.sanPhamId,
      'SoLuong': instance.soLuong,
      'GiaNhap': instance.giaNhap,
      'GiaBan': instance.giaBan,
      'GiaGiam': instance.giaGiam,
      'ThanhTien': instance.thanhTien,
      'Star': instance.star,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'san_pham': instance.sanPham,
    };
