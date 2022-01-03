// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quan_huyen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuanHuyen _$QuanHuyenFromJson(Map<String, dynamic> json) => QuanHuyen(
      name: json['name'] as String?,
      code: json['code'] as int?,
      divisionType: json['divisionType'] as String?,
      codename: json['codename'] as String?,
      provinceCode: json['provinceCode'] as int?,
    );

Map<String, dynamic> _$QuanHuyenToJson(QuanHuyen instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'divisionType': instance.divisionType,
      'codename': instance.codename,
      'provinceCode': instance.provinceCode,
    };
