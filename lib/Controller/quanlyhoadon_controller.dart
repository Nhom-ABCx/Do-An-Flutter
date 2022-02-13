import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/all_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class QuanLyHoaDonController extends ChangeNotifier {
  List<HoaDon> dsChiTietHoaDon = [];

  Future<List<HoaDon>> getData(int trangThai) async {
    print("getData");
    dsChiTietHoaDon = await api_GET_HoaDon_KhachHang_Theo_TrangThai(trangThai);
    return dsChiTietHoaDon;
  }

  Future<List<HoaDon>> getHoaDonHuy() async {
    print("getDataCancel");
    return await api_GET_HoaDon_KhachHang_DaHuy();
  }

  void deleteData(BuildContext context, int hoadonId) async {
    showCustomLoadding();

    if (await api_Delete_HoaDon(hoadonId)) {
      thongBaoScaffoldMessenger(context, "Cancel Success");
      EasyLoading.dismiss();
    } else {
      (thongBaoScaffoldMessenger(context, "Fails Cancel"));
      EasyLoading.dismiss();
    }
    notifyListeners();
  }

  void restoreData(BuildContext context, int hoadonId) async {
    showCustomLoadding();

    if (await api_Restore_HoaDon(hoadonId)) {
      thongBaoScaffoldMessenger(context, "Restore Success");
      EasyLoading.dismiss();
    } else {
      (thongBaoScaffoldMessenger(context, "Fails Restore"));
      EasyLoading.dismiss();
    }
    notifyListeners();
  }

  void danhGiaSanPham(BuildContext context, int hoaDonId, int idSanPham, int soSao) async {
    showCustomLoadding();
    final addStar = await api_Danh_Gia_SanPham(hoaDonId, idSanPham, soSao);

    if (addStar) {
      thongBaoScaffoldMessenger(context, "Add Success");
      EasyLoading.dismiss();
    } else {
      (thongBaoScaffoldMessenger(context, "Fails add"));
      EasyLoading.dismiss();
    }
    Navigator.pop(context);
    notifyListeners();
  }
}
