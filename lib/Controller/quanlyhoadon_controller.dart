import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/all_page.dart';

class QuanLyHoaDonController extends ChangeNotifier {
  List<HoaDon> dsChiTietHoaDon = [];

  Future<List<HoaDon>> getData(int trangThai) async {
    dsChiTietHoaDon = await api_GET_HoaDon_KhachHang_Theo_TrangThai(trangThai);
    return dsChiTietHoaDon;
  }
}
