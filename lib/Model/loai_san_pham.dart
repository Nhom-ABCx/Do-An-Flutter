import 'package:do_an_flutter/Model/base_model.dart';

class LoaiSanPham extends BaseModel<LoaiSanPham> {
  int? id;
  String? code;
  String? tenLoai;
  String? moTa;
  IconLoaiSanPham? icon;
  int? iLft;
  int? iRgt;
  int? parentId;
  List<LoaiSanPham>? children;

  LoaiSanPham({this.id, this.code, this.tenLoai, this.moTa, this.icon, this.iLft, this.iRgt, this.parentId, this.children});

  @override
  LoaiSanPham fromJson(Map<String, dynamic> json) => LoaiSanPham(
        id: json['id'],
        code: json['Code'],
        tenLoai: json['TenLoai'],
        moTa: json['MoTa'],
        icon: json['Icon'] != null ? IconLoaiSanPham.fromJson(json['Icon']) : null,
        iLft: json['_lft'],
        iRgt: json['_rgt'],
        parentId: json['parent_id'],
        children: json['children'] != null ? List<LoaiSanPham>.from((json['children'] as List).map((e) => LoaiSanPham().fromJson(e))) : null,
      );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Code'] = code;
    data['TenLoai'] = tenLoai;
    data['MoTa'] = moTa;
    data['Icon'] = icon != null ? icon!.toJson() : null;
    data['_lft'] = iLft;
    data['_rgt'] = iRgt;
    data['parent_id'] = parentId;
    data['children'] = children != null ? children!.map((v) => v.toJson()).toList() : null;

    return data;
  }
}

class IconLoaiSanPham {
  String? iconHtml;
  String? iconName;
  String? iconCode;

  IconLoaiSanPham({this.iconHtml, this.iconName, this.iconCode});

  IconLoaiSanPham.fromJson(Map<String, dynamic> json) {
    iconHtml = json['iconHtml'];
    iconName = json['iconName'];
    iconCode = json['iconCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iconHtml'] = iconHtml;
    data['iconName'] = iconName;
    data['iconCode'] = iconCode;
    return data;
  }
}
