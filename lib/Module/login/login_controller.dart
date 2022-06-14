import 'package:do_an_flutter/API/api_url.dart';
import 'package:do_an_flutter/Model/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../API/base_getconnect.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final txtUsername = TextEditingController(text: "Khach02");
  final txtPassword = TextEditingController(text: "password123");

  //
  final apiCall = Get.find<BaseGetConnect>();

  Future<Account?> loginApp(String userName, String passWord) =>
      apiCall.onPostObject(path: ApiUrl.post_login, baseModel: Account(), body: {"Username": userName, "MatKhau": passWord});
}
