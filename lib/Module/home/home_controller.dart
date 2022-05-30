import 'package:do_an_flutter/API/base_getconnect.dart';
import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final apiCall = Get.find<BaseGetConnect>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<List<SanPham>?> getListSanPham() async => apiCall.onGetList(SanPham(), "/search/san-pham");
}
