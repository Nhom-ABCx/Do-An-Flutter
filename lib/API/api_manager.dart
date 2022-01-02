import 'dart:io';
import 'dart:convert';
import 'dart:core';
import 'package:flutter_application_1/Controller/cart_provider.dart';
import 'package:http/http.dart' as http;
import '../all_page.dart';

String urlBaseAPI = "http://10.0.2.2:8000/api/";
// ignore: non_constant_identifier_names
Future<List<SanPham>> api_GetAll_SanPham() async {
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
    // ignore: empty_catches
  } catch (e) {}

  return lstSanPham;
}

//Điện thoại
// ignore: non_constant_identifier_names
Future<List<SanPham>> api_SanPham_LoaiSanPham(int loaiSanPhamId) async {
  List<SanPham> lstSanPhamTheoLoai = [];
  try {
    final response = await http.get(Uri.parse(urlBaseAPI + 'SanPham/LoaiSanPham/$loaiSanPhamId'));
    if (response.statusCode == 200) {
      List jsonlst = [];
      jsonlst = json.decode(response.body);
      lstSanPhamTheoLoai = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
    // ignore: empty_catches
  } catch (e) {}
  return lstSanPhamTheoLoai;
}

// san pham dt 1tr-3tr
// ignore: non_constant_identifier_names
Future<List<SanPham>> api_SanPham_GiaBan(int loaiSanPhamId, int priceFrom, int priceTo) async {
  List<SanPham> lstSanPham = [];
  try {
    final response = await http.get(Uri.parse(urlBaseAPI + 'SanPham/GiaBan?id=$loaiSanPhamId&PriceFrom=$priceFrom&PriceTo=$priceTo'));
    if (response.statusCode == 200) {
      List jsonlst = json.decode(response.body);
      lstSanPham = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
    // ignore: empty_catches
  } catch (e) {}
  return lstSanPham;
}

//Chi tiết sản phẩm
Future<SanPham> fetchProductData(String id) async {
  final url = urlBaseAPI + 'san-pham/$id';
  SanPham sanPhamChiTiet = SanPham(tenSanPham: "");
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jSonlst = json.decode(response.body);
      sanPhamChiTiet = SanPham.fromJson(jSonlst);
    }
    // ignore: empty_catches
  } catch (e) {}
  return sanPhamChiTiet;
}

// sản phẩm bán chạy
Future<List<SanPham>> fecthSanPhamBanChay() async {
  final url = urlBaseAPI + 'san-pham-top';
  List<SanPham> sanPhamTop = [];
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonlst = json.decode(response.body);
      sanPhamTop = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
    // ignore: empty_catches
  } catch (e) {}
  return sanPhamTop;
}

// San pham dang khuyen mai~
Future<List<SanPham>> fetchSanPhamSale() async {
  String url = urlBaseAPI + 'get-all-product-sale';
  List<SanPham> lstSanPhamSale = [];
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonlst = json.decode(response.body);
      return lstSanPhamSale = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
    // ignore: empty_catches
  } catch (e) {}
  return lstSanPhamSale;
}

//tiềm kiếm
Future<List<SanPham>> ftechSanPhamSearch(String tenSanPhamTiemKiem) async {
  final url = urlBaseAPI + "search-product?TenSanPham=$tenSanPhamTiemKiem";
  List<SanPham> lstSanPhamSearch = [];
  try {
    final response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonlst = json.decode(response.body);
      return lstSanPhamSearch = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}
  return lstSanPhamSearch;
}

//Dang nhap
// ignore: non_constant_identifier_names
Future<KhachHang> api_DangNhap(String email, String matkhau) async {
  var _khachHang = KhachHang.empty();

  try {
    final response = await http.post(Uri.parse(urlBaseAPI + "DangNhap"),
        body: {"Email": email, "MatKhau": matkhau, "Username": email, "Phone": email}).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      _khachHang = KhachHang.fromJson(jsonRaw);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return _khachHang;
}

// Dang ky
// ignore: non_constant_identifier_names
Future<dynamic> api_DangKy(String username, String email, String matkhau) async {
  try {
    final response = await http.post(Uri.parse(urlBaseAPI + "DangKy"), body: {"Username": username, "Email": email, "MatKhau": matkhau});
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      return KhachHang.fromJson(jsonRaw);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}
}

// ignore: non_constant_identifier_names
Future<dynamic> api_Update_KhachHang(KhachHang khachHang) async {
  final uri = Uri.parse(urlBaseAPI + "KhachHang/" + "${khachHang.id}?_method=PUT");

  try {
    final response = await http.post(
      uri,
      body: json.encode(khachHang.toJson()),
      headers: {"accept": "application/json", "content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      return KhachHang.fromJson(jsonRaw);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}
}

// ignore: non_constant_identifier_names
Future<bool> api_sendEmail_User_Reset(String username) async {
  bool _guiEmailThanhCong = false;
  try {
    final response = await http.post(Uri.parse(urlBaseAPI + "sendEmail-User-Reset"), body: {"Email": username, "Username": username});
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      _guiEmailThanhCong = jsonRaw["Success"];
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return _guiEmailThanhCong;
}

//them du lieu vao gio hang
// ignore: non_constant_identifier_names
Future<bool> api_HoaDon_LapHoaDon(int khachHangId) async {
  final url = urlBaseAPI + 'HoaDon/LapHoaDon';

  try {
    final cartProvider = CartProvider();
    final cart = await cartProvider.getData();

    if (cart.isEmpty) return false;

    List<Map<String, dynamic>> value = [];
    for (var item in cart) {
      value.add({"SanPhamId": "${item.productId}", "SoLuong": "${item.quantity}"});
    }
    final body = json.encode({"KhachHangId": "$khachHangId", "Data": value});
    final response = await http.post(Uri.parse(url), body: body, headers: {"accept": "application/json", "content-type": "application/json"});
    if (response.statusCode == 200) {
      return await cartProvider.deleteAllCart();
    }
    // ignore: empty_catches
  } catch (e) {}
  return false;
}

// ignore: non_constant_identifier_names
Future<dynamic> api_Update_KhachHang_HinhAnh(KhachHang khachHang, File imageFile) async {
  final uri = Uri.parse(urlBaseAPI + "KhachHang/" + "${khachHang.id}?_method=PATCH");

  try {
    //tao 1 request chua 1 hinh anh
    var request = http.MultipartRequest('POST', uri)..files.add(await http.MultipartFile.fromPath('HinhAnh', imageFile.path));
    //gui request do len sever, sever se luu hinh anh
    final streamedResponse = await request.send();
    //lay ket qua json tra ve cua sever
    final response = await http.Response.fromStream(streamedResponse);
    if (streamedResponse.statusCode == 200) {
      final jsonRaw = json.decode(response.body);
      return KhachHang.fromJson(jsonRaw);
    } else if (streamedResponse.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${streamedResponse.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}
}

// ignore: non_constant_identifier_names
Future<dynamic> api_Update_KhachHang_MatKhau(KhachHang khachHang, String oldPassword, String newPassword, String confirmPassword) async {
  final uri = Uri.parse(urlBaseAPI + "KhachHang/" + "${khachHang.id}/updatePassword?_method=PUT");

  try {
    final response = await http.post(
      uri,
      body: {"oldMatKhau": oldPassword, "MatKhau": newPassword, "XacNhan_MatKhau": confirmPassword},
    );
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);
      return KhachHang.fromJson(jsonRaw);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}
}

// ignore: non_constant_identifier_names
Future<KhachHang> api_GET_KhachHang(int id) async {
  var _khachHang = KhachHang.empty();

  try {
    final response = await http.get(Uri.parse(urlBaseAPI + "KhachHang/$id"));
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      final jsonRaw = json.decode(response.body);

      _khachHang = KhachHang.fromJson(jsonRaw);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return _khachHang;
}

// ignore: non_constant_identifier_names
Future<List<SanPham>> api_Get_SanPham_YeuThich(int khachHangId) async {
  List<SanPham> lstSanPham = [];

  try {
    final response = await http.get(Uri.parse(urlBaseAPI + "SanPham/YeuThich/$khachHangId"));
    if (response.statusCode == 200) {
      //nay` von' dang o dang List, ep kieu no' thanh List de co them phuong thuc'
      List jsonRaw = json.decode(response.body);
      //print(jsonRaw[0]['TenSanPham']); //truy xuat no' bang cach nhu nay`
      lstSanPham = jsonRaw.map((data) => SanPham.fromJson(data)).toList();
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return lstSanPham;
}

// ignore: non_constant_identifier_names
Future<bool> api_Get_YeuThich(int khachHangId, int SanPhamId) async {
  bool isYeuThich = false;
  try {
    final response = await http.get(Uri.parse(urlBaseAPI + "YeuThich?KhachHangId=$khachHangId&SanPhamId=$SanPhamId"));
    if (response.statusCode == 200) {
      isYeuThich = true;
    }
    // ignore: empty_catches
  } catch (e) {}
  return isYeuThich;
}

// ignore: non_constant_identifier_names
Future<bool> api_Insert_KhachHang_YeuThich_SanPham(int khachHangId, int sanPhamId) async {
  final uri = Uri.parse(urlBaseAPI + "YeuThich/add");
  bool success = false;
  try {
    final response = await http.post(uri, body: {"KhachHangId": "$khachHangId", "SanPhamId": "$sanPhamId"});
    if (response.statusCode == 200) {
      return success = true;
    }
    // ignore: empty_catches
  } catch (e) {}
  return success;
}

// ignore: non_constant_identifier_names
Future<bool> api_Delete_KhachHang_YeuThich_SanPham(int khachHangId, int sanPhamId) async {
  final uri = Uri.parse(urlBaseAPI + "YeuThich/delete?_method=DELETE");
  bool success = false;
  try {
    final response = await http.post(uri, body: {"KhachHangId": "$khachHangId", "SanPhamId": "$sanPhamId"});
    if (response.statusCode == 200) {
      return success = true;
    }
    // ignore: empty_catches
  } catch (e) {}
  return success;
}
