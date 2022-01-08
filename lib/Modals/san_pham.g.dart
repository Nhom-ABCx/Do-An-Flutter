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
      isFavorite: json['isFavorite'] == null ? 0 : json['isFavorite'] as int?,
      star: json['Star'] ==null ? 0.0 :json['Star']*1.0, //chuyen ve sang double
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
      'isFavorite': instance.isFavorite,
      'Star': instance.star,
    };
