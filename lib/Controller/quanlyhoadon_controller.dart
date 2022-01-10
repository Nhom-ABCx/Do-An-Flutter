import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/all_page.dart';

class QuanLyHoaDonController extends ChangeNotifier{
  List<CT_HoaDon> dsChiTietHoaDon=[];

   Future<List<CT_HoaDon>> getDataQuanLyHoaDon(int trangThai) async {
    dsChiTietHoaDon = await api_Get_SanPham_Pay(trangThai);
    return dsChiTietHoaDon;
  }
}