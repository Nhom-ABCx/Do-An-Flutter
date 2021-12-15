import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
<<<<<<< HEAD

=======
import 'package:flutter/material.dart';
import 'dart:io';
>>>>>>> c6eb7e4f3fa1bdbd7b404dab11e77e48798d7430
import '../all_page.dart';

String urlBaseAPI = "http://10.0.2.2:8000/api/";
Future<List<SanPham>> fetchSanPham() async {
  List<SanPham> lstSanPham = [];

  try {
    final response = await http.get(Uri.parse(urlBaseAPI + "SanPham"));
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      List jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      lstSanPham = jsonRaw.map((data) => SanPham.fromJson(data)).toList();
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}

  return lstSanPham;
}
<<<<<<< HEAD
Future<List<SanPham>> fetchSanPhamDienThoai() async{
  List<SanPham> lstSanPhamDienThoai=[];
  try {
    final response= await http.get(Uri.parse('http://10.0.2.2:8000/api/dien-thoai'));
    if (response.statusCode==200) {
      List jsonlst=[];
       jsonlst=json.decode(response.body);
      lstSanPhamDienThoai=jsonlst.map((data) => SanPham.fromJson(data)).toList();
      
=======

Future<KhachHang> api_DangNhap(String email, String matkhau) async {
  var khachHang = KhachHang(hoTen: "");

  try {
    final response = await http.post(Uri.parse(urlBaseAPI + "DangNhap"),
        body: {"Email": "$email", "MatKhau": "$matkhau", "Username": "$email", "Phone": "$email"});
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      khachHang = KhachHang.fromJson(jsonRaw);
>>>>>>> c6eb7e4f3fa1bdbd7b404dab11e77e48798d7430
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
  } catch (e) {}
<<<<<<< HEAD
  return lstSanPhamDienThoai;
}

Future<List<SanPham>> fetchProductData(String id) async{
  final url='http://10.0.2.2:8000/api/san-pham/$id';
  List<SanPham> sanPhamChiTiet=[];
  try {
    
    final response=await http.get(Uri.parse(url));
    if (response.statusCode==200) {
      List jSonlst= json.decode(response.body);
      sanPhamChiTiet=jSonlst.map((data) => SanPham.fromJson(data)).toList();
    }
  } catch (e) {}
  return sanPhamChiTiet;
=======

  return khachHang;
>>>>>>> c6eb7e4f3fa1bdbd7b404dab11e77e48798d7430
}
