import 'dart:async';

import 'package:flutter_application_1/all_page.dart';

class Auth {
  static KhachHang khachHang = KhachHang(hoTen: "");
  final nameController = StreamController();
  final emailController = StreamController();
  final passController = StreamController();

  Future<bool> ktDangNhap(String email, String pass) async {
    if (email.isEmpty) {
      emailController.sink.addError("Nhập username hoặc email");
      return false;
    }
    emailController.sink.add("");

    if (pass.isEmpty) {
      passController.sink.addError("Nhập mật khẩu");
      return false;
    }
    passController.sink.add("");

    khachHang = await api_DangNhap(email, pass) as KhachHang;

    return (khachHang.hoTen.isNotEmpty) ? true : false;
  }

  Future<bool> ktDangKy(String username, String email, String pass) async {
    if (username.isEmpty) {
      nameController.sink.addError("Nhập Username");
      return false;
    }
    nameController.sink.add("");

    if (email.isEmpty) {
      emailController.sink.addError("Nhập email");
      return false;
    } else if (!isValidEmail(email)) {
      emailController.sink.addError("Nhập đúng định dạng email");
      return false;
    }
    emailController.sink.add("");

    if (pass.isEmpty) {
      passController.sink.addError("Nhập mật khẩu");
      return false;
    }
    passController.sink.add("");

    //lay' du lieu API dang ky'
    var validate = await api_DangKy(username, email, pass);
    //neu' no' tra ve ko phai la class KhachHang thi` kiem tra no' tra? ve` loi~ nao` de hien thi
    if (!(validate is KhachHang)) {
      if (validate["Username"].toString() != "null") {
        nameController.sink.addError(validate["Username"]);
        return false;
      }
      if (validate["Email"].toString() != "null") {
        emailController.sink.addError(validate["Email"]);
        return false;
      }
      if (validate["MatKhau"].toString() != "null") {
        passController.sink.addError(validate["MatKhau"]);
        return false;
      }
    }

    khachHang = validate;
    return (khachHang.username!.isNotEmpty) ? true : false;
    // if (khachHang.hoTen.isNotEmpty) return true;
    // return false;
  }

  bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void dispose() {
    nameController.close();
    emailController.close();
    passController.close();
  }
}
