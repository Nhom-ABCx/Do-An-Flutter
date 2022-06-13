part of 'base_getconnect.dart';

extension BaseGetconnectExtensionRequest on BaseGetConnect {
  FutureOr<Request> requestInterceptor(Request request) async {
    final prefs = Get.find<Service>().sharedPreferences;

    if (prefs.getString(StorageConstants.token) != null) {
      request.headers['Authorization'] = 'Bearer ${prefs.getString(StorageConstants.token)}';
      request.headers['Accept'] = 'application/json, text/plain, */*';
    }

    request.headers['Content-Type'] = 'application/json;charset=UTF-8';
    request.headers['Charset'] = 'utf-8';

    //EasyLoading.show(status: StringConstant.PleaseWait.tr, maskType: EasyLoadingMaskType.black);
    Printt.yellow("${request.method}:  ${request.url.toString()}                           ------------request");
    return request;
  }

///////////////////////
  FutureOr<dynamic> responseInterceptor(Request request, Response response) async {
    //EasyLoading.dismiss();

    if (response.statusCode != 200 && response.statusCode != 201) {
      handleErrorStatus(response);
      return;
    }

    return response;
  }

  void handleErrorStatus(Response response) {
    switch (response.statusCode) {
      case 400:
      case 404:
      case 500:
        // final message = ErrorResponse.fromJson(response.body);
        // CommonWidget.toast(message.message);
        break;
      case 401:
        Get.find<Service>().sharedPreferences.setString(StorageConstants.token, '');
        // Get.toNamed(Routes.LOGIN);
        break;
      default:
        break;
    }
  }
// ////////////////////////////

//   FutureOr<Request> authInterceptor(Request request) {
//     final token =Get.find<Service>().sharedPreferences.getString(StorageConstants.token);

//       if (token != null) {
//         request.headers['Authorization'] = 'Bearer $token';
//         // request.headers['X-Requested-With'] = 'XMLHttpRequest';
//       }

//       return request;
  // }
}
