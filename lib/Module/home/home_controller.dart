import 'package:do_an_flutter/API/base_getconnect.dart';
import 'package:do_an_flutter/Model/hinh_anh.dart';
import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:get/get.dart';

//StateMixin dung` de loadding
//https://stackoverflow.com/questions/69842190/how-to-make-flutter-with-getx-wait-until-data-is-loaded
class HomeController extends GetxController {
  final apiCall = Get.find<BaseGetConnect>();
  RxList<SanPham> listSanPham = RxList.empty();
  RxList<HinhAnh> listBanner = RxList.empty();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getListSanPhamm();
  }

  // Future<void> getListSanPhamm() async {
  //   try {
  //     change(null, status: RxStatus.loading());
  //     apiCall.onGetList(SanPham(), "/search/san-pham").then((value) {
  //       listSanPham.value = value!;
  //       change(listSanPham, status: RxStatus.success());
  //     }, onError: (e) {
  //       change(null, status: RxStatus.error(e.toString()));
  //     });
  //   } catch (e) {
  //     change(null, status: RxStatus.error(e.toString()));
  //   }
  // }
  Future<List<SanPham>?> getListSanPham() => apiCall.onGetList("/search/san-pham", SanPham()).then((value) => listSanPham.value = value!);
  Future<List<HinhAnh>?> getBanner() => apiCall.onGetList("/banner", HinhAnh()).then((value) => listBanner.value = value!);
}
