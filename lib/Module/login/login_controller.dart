import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isShowPassword = true.obs;
  final txtUsername = TextEditingController(text: "Khach02");
  final txtPassword = TextEditingController(text: "password123");
}
