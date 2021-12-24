import '../all_page.dart';

class SanPhamController {
  static var Cart=[];
  static Future<void> AddCart(
      int khachHangId, int sanPhamId, int soLuong) async {
    Cart = await addCart(khachHangId, sanPhamId, soLuong);
  }
}
