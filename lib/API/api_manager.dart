import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../Pages/all_page.dart';

Future<List<SanPham>> fetchSanPham() async {
  List<SanPham> lstSanPham = [];
  final response =
      await http.get(Uri.parse("http://localhost:8000/api/SanPham"));
  if (response.statusCode == 200) {
    //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
    List jsonRaw = json.decode(response.body);
    //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
    //return jsonRaw.map((data) => SanPham.fromJson(data)).toList();
    for (int i = 0; i < jsonRaw.length; i++) {
      lstSanPham.add(SanPham(
        id: jsonRaw[i]["id"],
        tensanpham: jsonRaw[i]["TenSanPham"],
        mota: jsonRaw[i]["MoTa"],
        soluongton: jsonRaw[i]["SoLuongTon"],
        dongia: jsonRaw[i]["DonGia"],
        hinhanh: jsonRaw[i]["HinhAnh"],
        luotmua: jsonRaw[i]["LuotMua"],
        nhacungcapid: jsonRaw[i]["NhaCungCapId"],
        loaisanphamid: jsonRaw[i]["LoaiSanPhamId"],
        ngaynhap: DateTime.parse(jsonRaw[i]["created_at"]),
        ngaycapnhat: (jsonRaw[i]["updated_at"] != null)
            ? DateTime.parse(jsonRaw[i]["updated_at"])
            : null,
        //ngayxoa: jsonRaw[i][""],
      ));
    }
  } else {
    throw Exception("Something get wrong! Status code ${response.statusCode}");
  }
  return lstSanPham;
}
