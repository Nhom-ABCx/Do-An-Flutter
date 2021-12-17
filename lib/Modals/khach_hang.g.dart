// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'khach_hang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KhachHang _$KhachHangFromJson(Map<String, dynamic> json) => KhachHang(
      id: json['id'] as int?,
      username: json['Username'] as String,
      email: json['Email'] as String?,
      phone: json['Phone'] as String?,
      matKhau: json['MatKhau'] as String?,
      hoTen: json['HoTen'] as String?,
      ngaySinh: json['NgaySinh'] == null ? null : DateTime.parse(json['NgaySinh'] as String),
      gioiTinh: json['GioiTinh'] as int?,
      diaChi: json['DiaChi'] as String?,
      hinhAnh: json['HinhAnh'] as String?,
      createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null ? null : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$KhachHangToJson(KhachHang instance) => <String, dynamic>{
      'id': instance.id,
      'Username': instance.username,
      'Email': instance.email,
      'Phone': instance.phone,
      'MatKhau': instance.matKhau,
      'HoTen': instance.hoTen,
      'NgaySinh': instance.ngaySinh?.toIso8601String(),
      'GioiTinh': instance.gioiTinh,
      'DiaChi': instance.diaChi,
      'HinhAnh': instance.hinhAnh,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
