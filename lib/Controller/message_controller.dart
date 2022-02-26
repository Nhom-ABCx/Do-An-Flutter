// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Modals/message.dart';
import 'package:flutter_application_1/all_page.dart';

class MessageController extends ChangeNotifier {
  List<Message> message = [];

  Future<List<Message>> getData() async {
    print("vo ham` GetData mess");
    message = await api_GetAll_Message_Admin(Auth.khachHang.id!);
    return message;
  }

  Future<bool> addData(Message _message) async {
    final bool validate = await api_Them_Message_Admin(_message);
    notifyListeners();
    return validate;
  }
}
