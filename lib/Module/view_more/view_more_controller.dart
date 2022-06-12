import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:get/get.dart';

class ViewMoreController extends GetxController {
  final Map<String, dynamic> infoPage = Get.arguments;
  List<SanPham> listSanPham = <SanPham>[];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listSanPham = infoPage["arguments"] as List<SanPham>;
  }
}
