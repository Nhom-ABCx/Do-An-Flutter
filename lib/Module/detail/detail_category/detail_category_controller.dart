import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:get/get.dart';

import '../../../API/api_url.dart';
import '../../../API/base_getconnect.dart';

class DetaileCategoryController extends GetxController {
    final apiCall = Get.find<BaseGetConnect>();

  Future<List<SanPham>?> getListPrdtoType(int loaiSanPhamId) => apiCall.onGetList(ApiUrl.get_search("san-pham"), SanPham(), queryParam: {"LoaiSanPhamId": loaiSanPhamId});
}
