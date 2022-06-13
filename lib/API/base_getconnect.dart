import 'dart:async';
import 'dart:convert';
import 'package:do_an_flutter/Config/storage.dart';
import 'package:do_an_flutter/Model/base_model.dart';
import 'package:do_an_flutter/Ultis/helper_widget.dart';
import 'package:do_an_flutter/Ultis/print.dart';
import 'package:do_an_flutter/app_binding.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

part 'base_getconnect_request.dart';
part 'base_getconnect_response.dart';

class BaseGetConnect extends GetConnect {
  int get requestAgainSecond => 3;

  FutureOr<T> onTimeout<T>() {
    throw TimeoutException('Can\'t connect in ${httpClient.timeout.inSeconds} seconds. Please try again');
  }

  @override
  void onInit() {
    super.onInit();
    //
    httpClient.baseUrl = Get.find<Service>().baseUrl;
    httpClient.timeout = const Duration(seconds: 10);
    //
    //httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }

  //ghi de` lai phuong thuc post
  @override
  Future<Response<T>> post<T>(String? url, body,
      {String? contentType, Map<String, String>? headers, Map<String, dynamic>? query, Decoder<T>? decoder, Progress? uploadProgress}) {
    //xuat' cai da~ gui~ len sv
    Printt.green(jsonEncode(body));
    //
    return super.post(url, body, contentType: contentType, headers: headers, query: query, decoder: decoder, uploadProgress: uploadProgress);
  }
}
