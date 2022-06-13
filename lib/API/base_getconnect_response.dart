part of 'base_getconnect.dart';

extension BaseGetconnectExtensionResponse on BaseGetConnect {
  Future<T?> onGetObject<T>({required String path, required BaseModel<T> baseModel}) async {
    try {
      final res = await get(path).timeout(httpClient.timeout, onTimeout: onTimeout);
      if (res.statusCode == 200) return baseModel.fromJson(res.body);
    } on TimeoutException catch (_) {
      //CommonWidget.toast(_.message!);
      //EasyLoading.dismiss();
      // catch timeout here..
    } catch (e) {
      //EasyLoading.dismiss();
      print("has error, request again after ${requestAgainSecond}s ----- \x1B[31m${e.toString()}\x1B[0m");
      return await Future.delayed(Duration(seconds: requestAgainSecond), () => onGetObject(path: path, baseModel: baseModel));
    }
    return null;
  }

  Future<List<T>?> onGetList<T>({required String path, required BaseModel<T> baseModel, Map<String, dynamic>? queryParam}) async {
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
      print("has error, request again after ${requestAgainSecond}s ----- \x1B[31m${e.toString()}\x1B[0m");
      return await Future.delayed(Duration(seconds: requestAgainSecond), () => onGetList(path: path, baseModel: baseModel, queryParam: queryParam));
    }
    return null;
  }

  Future<T?> onPostObject<T>({required String path, required BaseModel<T> baseModel, required Map<String, dynamic> body}) async {
    try {
      final res = await post(path, body).timeout(httpClient.timeout, onTimeout: onTimeout);
      if (res.statusCode == 200) return baseModel.fromJson(res.body);
    } on TimeoutException catch (_) {
      //CommonWidget.toast(_.message!);
      //EasyLoading.dismiss();
      // catch timeout here..
    } catch (e) {
      //EasyLoading.dismiss();
      print("has error, request again after ${requestAgainSecond}s ----- \x1B[31m${e.toString()}\x1B[0m");
      return await Future.delayed(Duration(seconds: requestAgainSecond), () => onPostObject(path: path, baseModel: baseModel, body: body));
    }
    return null;
  }
}
