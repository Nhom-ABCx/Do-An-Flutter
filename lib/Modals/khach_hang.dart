import 'package:flutter/material.dart';
import 'package:flutter_application_1/DB/database_mb.dart';
import 'package:json_annotation/json_annotation.dart';

import '../Controller/auth_controller.dart';

part 'khach_hang.g.dart';

//Chạy câu lệnh flutter pub run build_runner watch trong terminal khi part 'user.g.dart' bị lỗi đỏ
@JsonSerializable(explicitToJson: true) // Nếu không có explicitToJson: true thì ko in được lớp ở trong.
class KhachHang {
  int? id;
  late String username;
  late String email;
  String? phone;
  //String? matKhau;
  String? hoTen;
  DateTime? ngaySinh;
  int? gioiTinh;
  String? diaChi;
  String? hinhAnh;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  KhachHang(
      {this.id,
      required this.username,
      required this.email,
      this.phone,
      //this.matKhau,
      this.hoTen,
      this.ngaySinh,
      this.gioiTinh,
      this.diaChi,
      this.hinhAnh,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});
  factory KhachHang.fromJson(dynamic json) => _$KhachHangFromJson(json);
  Map<String, dynamic> toJson() => _$KhachHangToJson(this);

  KhachHang.empty() {
    id = -1;
    username = "";
    email = "";
    phone = "";
    //matKhau = "";
    hoTen = "";
    ngaySinh = DateTime.now();
    gioiTinh = 0;
    diaChi = "";
    hinhAnh = "";
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
    deletedAt = DateTime.now();
  }
  // ignore: non_constant_identifier_names
  void LogOut(BuildContext context) {
    //Db().deleteItemKH(id!); //nay` la` xoa' 1 tai` khoan?
    Db().deleteAllKH(); //xoa' het',tai dang bi loi social login
    SocialLogin().logOut();

    id = -1;
    username = "";
    email = "";
    phone = "";
    //matKhau = "";
    hoTen = "";
    ngaySinh = DateTime.now();
    gioiTinh = 0;
    diaChi = "";
    hinhAnh = "";
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
    deletedAt = DateTime.now();

    Navigator.pushNamedAndRemoveUntil(context, "/Sign_In", (route) => false);
  }
}
