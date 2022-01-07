import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../all_page.dart';
class BinhLuanController extends ChangeNotifier{
  List<BinhLuan> dsBinhLuans=[];
  final noiDungBinhLuan=StreamController();

  //lay ve tat ca binh luan cua san pham
  Future<List<BinhLuan>> getData(int idSanPham) async{
    dsBinhLuans=  await api_GetAll_BinhLuan(idSanPham);
    return dsBinhLuans;
  }

  //them binh luan moi
  Future<bool> addBinhLuan(String noiDung,int idSanPham) async{
    noiDungBinhLuan.sink.add("");
    final validate= await api_Add_BinhLuan(noiDung, Auth.khachHang.id!, idSanPham);
    // ignore: unrelated_type_equality_checks
    if (validate is!bool) {
      if (validate["NoiDung"].toString()!="null") {
        noiDungBinhLuan.addError(validate["NoiDung"]);
        return false;
      }
    }
     notifyListeners();
    return validate?true:false;
   
  }
}

