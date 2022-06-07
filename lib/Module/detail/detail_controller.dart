import 'package:collection/collection.dart';
import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final SanPham sanPham = Get.arguments as SanPham;
  final RxInt selectedIndexCTSanPham = 0.obs;
  int get giaBan => sanPham.cTSanPham![selectedIndexCTSanPham.value].giaBan!;
  int get giaGiam => sanPham.cTSanPham![selectedIndexCTSanPham.value].giamGia!;
  //
  late RxList<String> lstToHop = <String>[].obs;
  final equal = const IterableEquality();

  void onChangDropDownThuocTinh(String? value, int index) {
    {
      lstToHop[index] = value!;
      //
      final ctSanPham = sanPham.cTSanPham!;
      for (int i = 0; i < ctSanPham.length; i++) {
        //so sanh giua 2 mang?
        if (equal.equals(lstToHop, ctSanPham[i].thuocTinhValue!)) selectedIndexCTSanPham.value = i;
      }
      print("selectIndexCTSanPham: ${selectedIndexCTSanPham.value}");

      //setState(() => lstToHop[index] = value!)
    }
  }
}
