import 'dart:async';
import 'package:do_an_flutter/Config/storage.dart';
import 'package:do_an_flutter/Model/base_model.dart';
import 'package:do_an_flutter/Ultis/print.dart';
import 'package:do_an_flutter/app_binding.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

part 'base_getconnect.g.dart';

class BaseGetConnect extends GetConnect {
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

  Future<T?> onGetObject<T>(String path, BaseModel<T> baseModel) async {
    try {
      final res = await get(path).timeout(httpClient.timeout, onTimeout: onTimeout);
      if (res.statusCode == 200) {
        return baseModel.fromJson(res.body);
      }
    } on TimeoutException catch (_) {
      //CommonWidget.toast(_.message!);
      //EasyLoading.dismiss();
      // catch timeout here..
    } catch (e) {
      //EasyLoading.dismiss();
      print("has error, request again after 3s-----");
      return await Future.delayed(const Duration(seconds: 3), () => onGetObject(path, baseModel));
    }
    return null;
  }

  Future<List<T>?> onGetList<T>(String path, BaseModel<T> baseModel, {Map<String, dynamic>? queryParam}) async {
    try {
      final res = await get<List>(
        path,
        query: queryParam?.map((key, value) => MapEntry(key, value.toString())), //{"a": 1}  =>{"a": "1"}  tranh' loi~
      ).timeout(httpClient.timeout, onTimeout: onTimeout);
      if (res.statusCode == 200) {
        final List<T> listResult = res.body!.map((e) => baseModel.fromJson(e)).toList();

        return listResult;
      }
    } on TimeoutException catch (_) {
      //CommonWidget.toast(_.message!);
      //EasyLoading.dismiss();
      // catch timeout here..
    } catch (e) {
      //EasyLoading.dismiss();
      print("has error, request again after 3s ----- \x1B[31m${e.toString()}\x1B[0m");
      return await Future.delayed(const Duration(seconds: 3), () => onGetList(path, baseModel, queryParam: queryParam));
    }
    return null;
  }
}
