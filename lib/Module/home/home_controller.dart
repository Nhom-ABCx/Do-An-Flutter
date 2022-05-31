import 'package:do_an_flutter/API/base_getconnect.dart';
import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:get/get.dart';

//StateMixin dung` de loadding
class HomeController extends GetxController {
  final apiCall = Get.find<BaseGetConnect>();
  RxList<SanPham> listSanPham = RxList.empty();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<List<SanPham>?> getListSanPham() => apiCall.onGetList(SanPham(), "/search/san-pham").then((value) => listSanPham.value = value!);
}
