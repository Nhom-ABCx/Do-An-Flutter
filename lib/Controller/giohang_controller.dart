import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../all_page.dart';

class GioHangController extends ChangeNotifier {
  List<GioHang> gioHang = [];

  int i = 0;
  Future<List<GioHang>> getData() async {
    print("get GioHang $i");
    gioHang = await api_Get_GioHang(Auth.khachHang.id!);
    i++;
    return gioHang;
  }

  void addData(BuildContext context, int sanPhamId, int soLuong) async {
    showCustomLoadding();

    if (await api_Insert_SanPham_GioHang(Auth.khachHang.id!, sanPhamId, soLuong)) {
      thongBaoScaffoldMessenger(context, "Add Success");
      EasyLoading.dismiss();
    } else {
      (thongBaoScaffoldMessenger(context, "Fails Add"));
      EasyLoading.dismiss();
    }
    notifyListeners();
  }

  void updateData(BuildContext context, int sanPhamId, int soLuong) async {
    await api_Update_SanPham_GioHang(Auth.khachHang.id!, sanPhamId, soLuong);
    notifyListeners();
  }

  void deleteData(BuildContext context, int sanPhamId) async {
    showCustomLoadding();

    if (await api_Delete_SanPham_GioHang(Auth.khachHang.id!, sanPhamId)) {
      thongBaoScaffoldMessenger(context, "Delete Success");
      EasyLoading.dismiss();
    } else {
      (thongBaoScaffoldMessenger(context, "Fails Delete"));
      EasyLoading.dismiss();
    }
    notifyListeners();
  }
}
