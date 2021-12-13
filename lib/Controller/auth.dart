import 'dart:async';

class Auth {
  final nameController = StreamController();
  final emailController = StreamController();
  final passController = StreamController();
  final phoneController = StreamController();

  bool ktDangNhap(String email, String pass) {
    if (email.isEmpty) {
      emailController.sink.addError("Nhập email");
      return false;
    }
    emailController.sink.add("");

    if (pass.isEmpty) {
      passController.sink.addError("Nhập mật khẩu");
      return false;
    }
    passController.sink.add("");

    return true;
  }

  void dispose() {
    nameController.close();
    emailController.close();
    passController.close();
    phoneController.close();
  }
}
