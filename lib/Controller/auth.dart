import 'dart:async';
import 'package:flutter_application_1/DB/database_mb.dart';
import 'package:flutter_application_1/all_page.dart';

class Auth {
  static KhachHang khachHang = KhachHang.empty();
  final nameController = StreamController();
  final emailController = StreamController();
  final passController = StreamController();

  Future<bool> ktDangNhap(String email, String pass) async {
//kt rong~
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

    khachHang = await api_DangNhap(email, pass);

    if (khachHang.email.isNotEmpty) {
      khachHang = await Db().insertIfExistItemKH(khachHang);
      return true;
    }
    return false;
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
    final validate = await api_DangKy(username, email, pass);
    //neu' no' tra ve ko phai la class KhachHang thi` kiem tra no' tra? ve` loi~ nao` de hien thi
    if (validate is! KhachHang) {
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

    if (validate is KhachHang) khachHang = validate; //kt lai 1 lan nua cho no chac chan'
    return (khachHang.email.isNotEmpty) ? true : false;
    // if (khachHang.hoTen.isNotEmpty) return true;
    // return false;
  }

  Future<bool> ktResetMK(String username) async {
    if (username.isEmpty) {
      emailController.sink.addError("Nhập username hoặc email");
      return false;
    }
    emailController.sink.add("");

    final kq = await api_sendEmail_User_Reset(username);

    return kq;
  }

  static bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static Future<bool> ktDaCoTaiKhoanDangNhap() async {
    var _khDangCoTrongDatabase = await Db().getFirstItemsKH();
    if (khachHang.email != _khDangCoTrongDatabase.email) {
      //lay du lieu tu databse sever
      final _kh = await api_GET_KhachHang(_khDangCoTrongDatabase.id!);
      //cap nhat lai trong android
      Db().updateItemKH(_kh);
      //gan' bien' static de su dung
      khachHang = _kh;
      return true;
    }
    return false;
  }

  void dispose() {
    nameController.close();
    emailController.close();
    passController.close();
  }
}
