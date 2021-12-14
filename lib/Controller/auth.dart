import 'dart:async';

import 'package:flutter_application_1/all_page.dart';

class Auth {
  static KhachHang khachHang = KhachHang(hoTen: "");
  final nameController = StreamController();
  final emailController = StreamController();
  final passController = StreamController();
  final phoneController = StreamController();

  Future<bool> ktDangNhap(String email, String pass) async {
    if (email.isEmpty) {
      emailController.sink.addError("Nhập email");
      return false;
    }
    //emailController.sink.add("");

    if (pass.isEmpty) {
      passController.sink.addError("Nhập mật khẩu");
      return false;
    }
    //passController.sink.add("");

    khachHang = await api_DangNhap(email, pass) as KhachHang;

    return (khachHang.hoTen.isNotEmpty) ? true : false;
    // if (khachHang.hoTen.isNotEmpty) return true;
    // return false;
  }

  void dispose() {
    nameController.close();
    emailController.close();
    passController.close();
    phoneController.close();
  }
}
