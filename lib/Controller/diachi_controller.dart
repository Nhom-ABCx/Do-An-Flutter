import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/all_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DiaChiController extends ChangeNotifier {
  List<DiaChi> diaChi = [];
  ValidationItem tenNguoiNhan = ValidationItem("", "");
  ValidationItem phone = ValidationItem("", "");
  ValidationItem diaChiCHiTiet = ValidationItem("", "");

  // bool get isEmpty {
  //   if (tenNguoiNhan.value.isEmpty && phone.value.isEmpty && diaChiCHiTiet.value.isEmpty) return true;
  //   return false;
  // }

  Future<List<DiaChi>> getData() async {
    diaChi = await api_GetAll_DiaChi(Auth.khachHang.id!);
    return diaChi;
  }

//dia chi cu? cap nhat thanh dia chi moi'
  Future<bool> updateData(BuildContext context, DiaChi _diaChiMoi, int idDiaChiHienTaiCapNhat) async {
    tenNguoiNhan = ValidationItem("", "");
    phone = ValidationItem("", "");
    diaChiCHiTiet = ValidationItem("", "");
    if (_diaChiMoi.tenNguoiNhan.isEmpty) {
      tenNguoiNhan = ValidationItem("", "Không được bỏ trống !");
      return false;
    }

    if (_diaChiMoi.phone.isEmpty) {
      phone = ValidationItem("", "Không được bỏ trống !");
      return false;
    }

    if (_diaChiMoi.diaChiChiTiet.isEmpty) {
      diaChiCHiTiet = ValidationItem("", "Không được bỏ trống !");
      return false;
    }

    //neu nhu id ko phai la -1 cua ham khoi tao empty()
    _diaChiMoi.id = idDiaChiHienTaiCapNhat; //cap nhat cai dia chi
    //lay du lieu ve`
    final validate = await api_Update_DiaChi(_diaChiMoi);
    //neu' no' tra ve ko phai la true/false thi` kiem tra no' tra? ve` loi~ nao` de hien thi
    if (validate is! bool) {
      if (validate["TenNguoiNhan"].toString() != "null") {
        tenNguoiNhan.error = validate["TenNguoiNhan"];
        return false;
      }
      if (validate["Phone"].toString() != "null") {
        phone.error = validate["Phone"];
        return false;
      }
      if (validate["DiaChiChiTiet"].toString() != "null") {
        diaChiCHiTiet.error = validate["DiaChiChiTiet"];
        return false;
      }
    }

    notifyListeners();
    return validate ? true : false;
  }

  Future<bool> addData(BuildContext context, DiaChi _diaChiMoi) async {
    tenNguoiNhan = ValidationItem("", "");
    phone = ValidationItem("", "");
    diaChiCHiTiet = ValidationItem("", "");
    if (_diaChiMoi.tenNguoiNhan.isEmpty) {
      tenNguoiNhan = ValidationItem("", "Không được bỏ trống !");
      return false;
    }

    if (_diaChiMoi.phone.isEmpty) {
      phone = ValidationItem("", "Không được bỏ trống !");
      return false;
    }

    if (_diaChiMoi.diaChiChiTiet.isEmpty) {
      diaChiCHiTiet = ValidationItem("", "Không được bỏ trống !");
      return false;
    }

    //lay du lieu ve`
    final validate = await api_Insert_DiaChi(_diaChiMoi);
    //neu' no' tra ve ko phai la true/false thi` kiem tra no' tra? ve` loi~ nao` de hien thi
    if (validate is! bool) {
      if (validate["TenNguoiNhan"].toString() != "null") {
        tenNguoiNhan.error = validate["TenNguoiNhan"];
        return false;
      }
      if (validate["Phone"].toString() != "null") {
        phone.error = validate["Phone"];
        return false;
      }
      if (validate["DiaChiChiTiet"].toString() != "null") {
        diaChiCHiTiet.error = validate["DiaChiChiTiet"];
        return false;
      }
    }

    notifyListeners();
    return validate ? true : false;
  }

  void deleteData(BuildContext context, DiaChi _diaChi) async {
    final success = await api_Delete_DiaChi(_diaChi.id!);
    if (success) {
      thongBaoScaffoldMessenger(context, "Delete Success");
      EasyLoading.dismiss();
    } else {
      (thongBaoScaffoldMessenger(context, "Fails Delete"));
      EasyLoading.dismiss();
    }
    notifyListeners();
  }
}
