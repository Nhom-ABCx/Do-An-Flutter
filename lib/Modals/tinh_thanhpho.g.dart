// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tinh_thanhpho.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TinhThanhPho _$TinhThanhPhoFromJson(Map<String, dynamic> json) => TinhThanhPho(
      name: json['name'] as String?,
      code: json['code'] as int?,
      divisionType: json['divisionType'] as String?,
      codename: json['codename'] as String?,
      phoneCode: json['phoneCode'] as int?,
    );

Map<String, dynamic> _$TinhThanhPhoToJson(TinhThanhPho instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'divisionType': instance.divisionType,
      'codename': instance.codename,
      'phoneCode': instance.phoneCode,
    };
