// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dia_chi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaChi _$DiaChiFromJson(Map<String, dynamic> json) => DiaChi(
      id: json['id'] as int?,
      khachHangId: json['KhachHangId'] as int,
      tenNguoiNhan: json['TenNguoiNhan'] as String,
      phone: json['Phone'] as String,
      tinhThanhPho: json['TinhThanhPho'] as String?,
      quanHuyen: json['QuanHuyen'] as String?,
      phuongXa: json['PhuongXa'] as String?,
      diaChiChiTiet: json['DiaChiChiTiet'] as String,
    );

Map<String, dynamic> _$DiaChiToJson(DiaChi instance) => <String, dynamic>{
      'id': instance.id,
      'KhachHangId': instance.khachHangId,
      'TenNguoiNhan': instance.tenNguoiNhan,
      'Phone': instance.phone,
      'TinhThanhPho': instance.tinhThanhPho,
      'QuanHuyen': instance.quanHuyen,
      'PhuongXa': instance.phuongXa,
      'DiaChiChiTiet': instance.diaChiChiTiet,
    };
