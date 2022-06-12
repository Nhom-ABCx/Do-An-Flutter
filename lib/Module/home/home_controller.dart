import 'package:do_an_flutter/API/api_url.dart';
import 'package:do_an_flutter/API/base_getconnect.dart';
import 'package:do_an_flutter/Model/hinh_anh.dart';
import 'package:do_an_flutter/Model/loai_san_pham.dart';
import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:do_an_flutter/Ultis/info_page.dart';
import 'package:get/get.dart';

//StateMixin dung` de loadding
//https://stackoverflow.com/questions/69842190/how-to-make-flutter-with-getx-wait-until-data-is-loaded
class HomeController extends GetxController {
  final apiCall = Get.find<BaseGetConnect>();
  late Future<List<SanPham>?> listSanPham;
  late Future<List<HinhAnh>?> listBanner;
  late Future<List<LoaiSanPham>?> listLoaiSanPham;
  late Future<List<SanPham>?> listSanPhamKhuyenMai;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getListSanPhamm();
    listSanPham = getListSanPham();
    listBanner = getBanner();
    listLoaiSanPham = getistLoaiSanPham();
    listSanPhamKhuyenMai = getListSanPhamKhuyenMai();
    print("init success");
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
  Future<void> redirectToViewMore(String viewMorePage) async {
    Map<String, dynamic> data = {};

    switch (viewMorePage) {
      case InforPage.viewMoreSale:
        data = InforPage.filterPage(viewMorePage, await listSanPhamKhuyenMai);
        break;
      case InforPage.viewMoreRecent:
        data = InforPage.filterPage(viewMorePage, await listSanPham);
        break;
    }

    Get.toNamed(data['screen'], arguments: data);
  }

  //
  Future<List<SanPham>?> getListSanPham() => apiCall.onGetList(ApiUrl.get_search("san-pham"), SanPham());
  Future<List<HinhAnh>?> getBanner() => apiCall.onGetList(ApiUrl.get_banner, HinhAnh());
  Future<List<LoaiSanPham>?> getistLoaiSanPham() => apiCall.onGetList(ApiUrl.get_search("loai-san-pham"), LoaiSanPham());
  Future<List<SanPham>?> getListSanPhamKhuyenMai() =>
      apiCall.onGetList(ApiUrl.get_search("san-pham"), SanPham(), queryParam: {"isKhuyenMai": 1}); //true/false
}
