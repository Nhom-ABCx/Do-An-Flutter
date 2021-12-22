import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/all_page.dart';
import 'dart:io';

class EditMyProfileController {
  final usernameController = StreamController();
  final hotenController = StreamController();
  final phoneController = StreamController();
  final emailController = StreamController();
  final ngaysinhController = StreamController();
  final gioitinhController = StreamController();
  final diachiController = StreamController();
  final hinhanhController = StreamController();

  Future<bool> ktUpdateKhachHang(KhachHang _khachHang) async {
    //kt rong~
    if (_khachHang.username.isEmpty) {
      usernameController.sink.addError("Nhập Username");
      return false;
    }

    if (_khachHang.email!.isEmpty) {
      emailController.sink.addError("Nhập email");
      return false;
    } else if (!Auth.isValidEmail(_khachHang.email!)) {
      emailController.sink.addError("Nhập đúng định dạng email");
      return false;
    }
    usernameController.sink.add("");
    hotenController.sink.add("");
    phoneController.sink.add("");
    emailController.sink.add("");
    ngaysinhController.sink.add("");
    gioitinhController.sink.add("");
    diachiController.sink.add("");
    hinhanhController.sink.add("");

    //lay du lieu tu SV, neu co loi~ thi` validate
    final validate = await api_Update_KhachHang(Auth.khachHang);
    //neu' no' tra ve ko phai la class thi` kiem tra no' tra? ve` loi~ nao` de hien thi
    if (validate is! KhachHang) {
      if (validate["Username"].toString() != "null") {
        usernameController.sink.addError(validate["Username"]);
        return false;
      }
      if (validate["Email"].toString() != "null") {
        emailController.sink.addError(validate["Email"]);
        return false;
      }
      if (validate["Phone"].toString() != "null") {
        phoneController.sink.addError(validate["Phone"]);
        return false;
      }
      if (validate["NgaySinh"].toString() != "null") {
        ngaysinhController.sink.addError(validate["NgaySinh"]);
        return false;
      }
      if (validate["GioiTinh"].toString() != "null") {
        gioitinhController.sink.addError(validate["GioiTinh"]);
        return false;
      }
      if (validate["HinhAnh"].toString() != "null") {
        hinhanhController.sink.addError(validate["HinhAnh"]);
        return false;
      }
    }

    //xac dinh lại lần nữa cho chắc
    if (validate is KhachHang) Auth.khachHang = validate;
    return (Auth.khachHang.username.isNotEmpty) ? true : false;
  }

  void dispose() {
    usernameController.close();
    hotenController.close();
    phoneController.close();
    emailController.close();
    ngaysinhController.close();
    gioitinhController.close();
    diachiController.close();
    hinhanhController.close();
  }
}
