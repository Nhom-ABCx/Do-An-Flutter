// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:convert';
import 'dart:core';
import 'package:flutter_application_1/Modals/binh_luan.dart';
import 'package:http/http.dart' as http;
import '../all_page.dart';

const urlBaseAPI = "http://10.0.2.2:8000/api/";
const urlProvincesOpenApi = "https://provinces.open-api.vn/api/";

Future<List<SanPham>> api_GetAll_SanPham() async {
  List<SanPham> lstSanPham = [];

  try {
    final response = await http.get(Uri.parse(urlBaseAPI + "SanPham?KhachHangId=${Auth.khachHang.id}"));
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

Future<List<SanPham>> api_SanPham_LoaiSanPham(int loaiSanPhamId) async {
  List<SanPham> lstSanPhamTheoLoai = [];
  try {
    final response = await http.get(Uri.parse(urlBaseAPI + 'SanPham/LoaiSanPham/$loaiSanPhamId?KhachHangId=${Auth.khachHang.id}'));
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

Future<List<SanPham>> api_SanPham_GiaBan(int loaiSanPhamId, int priceFrom, int priceTo) async {
  List<SanPham> lstSanPham = [];
  try {
    final response = await http
        .get(Uri.parse(urlBaseAPI + 'SanPham/GiaBan?KhachHangId=${Auth.khachHang.id}&id=$loaiSanPhamId&PriceFrom=$priceFrom&PriceTo=$priceTo'));
    if (response.statusCode == 200) {
      List jsonlst = json.decode(response.body);
      lstSanPham = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
    // ignore: empty_catches
  } catch (e) {}
  return lstSanPham;
}

//Chi tiết sản phẩm
Future<SanPham> fetchProductData(int id) async {
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
  final url = urlBaseAPI + 'san-pham-top?KhachHangId=${Auth.khachHang.id}';
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
  String url = urlBaseAPI + 'SanPham/GiamGia?KhachHangId=${Auth.khachHang.id}';
  List<SanPham> lstSanPhamSale = [];
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonlst = json.decode(response.body);
      lstSanPhamSale = jsonlst.map((data) => SanPham.fromJson(data)).toList();
    }
    // ignore: empty_catches
  } catch (e) {}
  return lstSanPhamSale;
}

//tiềm kiếm
Future<List<SanPham>> ftechSanPhamSearch(String tenSanPhamTiemKiem) async {
  final url = urlBaseAPI + "search-product?TenSanPham=$tenSanPhamTiemKiem&KhachHangId=${Auth.khachHang.id}";
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

Future<bool> api_HoaDon_LapHoaDon(int khachHangId) async {
  const url = urlBaseAPI + 'HoaDon/LapHoaDon';

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

Future<List<SanPham>> api_Get_SanPham_YeuThich(int khachHangId) async {
  List<SanPham> lstSanPham = [];

  try {
    final response = await http.get(Uri.parse(urlBaseAPI + "SanPham/YeuThich?KhachHangId=$khachHangId"));
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

//Gia giam
Future<KhuyenMai> api_Price_Sale(int idSanPham) async {
  final uri = Uri.parse(urlBaseAPI + "khuyen-mai/$idSanPham");
  KhuyenMai ctKhuyenMai = KhuyenMai();
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonRaw = json.decode(response.body);
      ctKhuyenMai = KhuyenMai.fromJson(jsonRaw);
    }
  } catch (_) {}
  return ctKhuyenMai;
}

Future<List<TinhThanhPho>> api_GetAll_TinhThanhPho(String search) async {
  List<TinhThanhPho> lst = [];

  try {
    final response =
        await http.get(Uri.parse(urlProvincesOpenApi + "p/"), headers: {"accept": "application/json", "content-type": "application/json"});
    if (response.statusCode == 200) {
      List jsonRaw = json.decode(utf8.decode(response.bodyBytes)); //utf8 cho json ko bi lỗi font
      lst = jsonRaw.map((data) => TinhThanhPho.fromJson(data)).where((element) {
        final nameLower = element.name!.toLowerCase(); //chuyen cai ten thanh chu thuong` het
        final queryLower = search.toLowerCase();
        return nameLower.contains(queryLower); //tra ve ton` tai
      }).toList();
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return lst;
}

Future<List<QuanHuyen>> api_GetAll_QuanHuyen(int codeTinhThanhPho, String search) async {
  List<QuanHuyen> lst = [];

  try {
    final response = await http.get(Uri.parse(urlProvincesOpenApi + "p/$codeTinhThanhPho?depth=2"),
        headers: {"accept": "application/json", "content-type": "application/json"});
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonRaw = json.decode(utf8.decode(response.bodyBytes)); //cho json ko bị lỗi font
      final List _quanHuyen = jsonRaw['districts'];
      lst = _quanHuyen.map((data) => QuanHuyen.fromJson(data)).where((element) {
        final nameLower = element.name!.toLowerCase(); //chuyen cai ten thanh chu thuong` het
        final queryLower = search.toLowerCase();
        return nameLower.contains(queryLower); //tra ve ton` tai
      }).toList();
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return lst;
}

Future<List<PhuongXa>> api_GetAll_PhuongXa(int codeQuanHuyen, String search) async {
  List<PhuongXa> lst = [];

  try {
    final response = await http.get(Uri.parse(urlProvincesOpenApi + "d/$codeQuanHuyen?depth=2"),
        headers: {"accept": "application/json", "content-type": "application/json"});
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonRaw = json.decode(utf8.decode(response.bodyBytes)); //utf8 cho json ko bị lỗi font
      final List _phuongXa = jsonRaw['wards'];
      lst = _phuongXa.map((data) => PhuongXa.fromJson(data)).where((element) {
        final nameLower = element.name!.toLowerCase(); //chuyen cai ten thanh chu thuong` het
        final queryLower = search.toLowerCase();
        return nameLower.contains(queryLower); //tra ve ton` tai
      }).toList();
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return lst;
}

Future<List<DiaChi>> api_GetAll_DiaChi(int khachHangId) async {
  List<DiaChi> lst = [];

  try {
    final response = await http.get(Uri.parse(urlBaseAPI + "DiaChi/$khachHangId"));
    if (response.statusCode == 200) {
      List jsonRaw = json.decode(response.body);

      lst = jsonRaw.map((data) => DiaChi.fromJson(data)).toList();
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}

  return lst;
}

Future<dynamic> api_Insert_DiaChi(DiaChi diaChi) async {
  final uri = Uri.parse(urlBaseAPI + "DiaChi/add");

  try {
    final response = await http.post(
      uri,
      body: json.encode(diaChi.toJson()),
      headers: {"accept": "application/json", "content-type": "application/json"},
    );

    if (response.statusCode == 200) {
      //neu nhu them thanh cong thi return true
      return true;
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    }
    // ignore: empty_catches
  } catch (e) {}
}

Future<dynamic> api_Update_DiaChi(DiaChi diaChi) async {
  final uri = Uri.parse(urlBaseAPI + "DiaChi/update/${diaChi.id}?_method=PUT");

  try {
    final response = await http.post(
      uri,
      body: json.encode(diaChi.toJson()),
      headers: {"accept": "application/json", "content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      //neu nhu update thanh cong thi return true
      return true;
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else {
      throw Exception("Something get wrong! Status code ${response.statusCode}");
    }
    // ignore: empty_catches
  } catch (e) {}
}

Future<bool> api_Delete_DiaChi(int diaChiId) async {
  final uri = Uri.parse(urlBaseAPI + "DiaChi/delete/$diaChiId?_method=DELETE");
  bool success = false;
  try {
    final response = await http.post(uri);
    if (response.statusCode == 200) {
      return success = true;
    }
    // ignore: empty_catches
  } catch (e) {}
  return success;
}

// get binh luan
Future<List<BinhLuan>> api_GetAll_BinhLuan(int idSanPham) async {
  final uri = Uri.parse(urlBaseAPI + "binh-luan/$idSanPham");
  List<BinhLuan> lstBinhLuan = [];
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List jsonRaw = json.decode(response.body);
      lstBinhLuan = jsonRaw.map((e) => BinhLuan.fromJson(e)).toList();
    }
  } catch (_) {}
  return lstBinhLuan;
}
//tra ve khi ds binh luan co thay doi
Stream<List<BinhLuan>> getBinhLuans(Duration refreshTime,int idSanPham) async*{
  while(true){
    await Future.delayed(refreshTime);
    yield await api_GetAll_BinhLuan(idSanPham);
  }
}
//add binh luan
Future<dynamic> api_Add_BinhLuan(String noiDung, int khachHangId, int sanPhamId) async {
  final uri = Uri.parse(urlBaseAPI + "binh-luan/add");
  bool status = false;
  try {
    final response = await http.post(uri, body: {"NoiDung": noiDung, "KhachHangId": "$khachHangId", "SanPhamId": "$sanPhamId"});
    if (response.statusCode == 200) {
      return status = true;
    }else if(response.statusCode==400){
      return json.decode(response.body);
    }
    
    // ignore: empty_catches
  } catch (e) {}
  return status;
}
//kiem tra tk duoc binh luan san pham
Future<bool> api_Kiem_Tra_Auth_BinhLuan(int idSanPham) async{
  final uri =Uri.parse(urlBaseAPI+"binh-luan?KhachHangId=${Auth.khachHang.id}");
  bool check=false;
  try {
    final response=await http.get(uri);
   if (response.statusCode==200) {
     List jsonRaw = json.decode(response.body);
      final lstSanPham = jsonRaw.map((e) => SanPham.fromJson(e)).toList();
      final ss = lstSanPham.where((element) => element.id == idSanPham).toList();
      if (ss.isNotEmpty) {
        check = true;
      }
   }
  } catch (_) {}
  return check;
}
//ds san pham da mua
Future<List<SanPham>> api_ListProduct_Auth_Buy() async {
  final uri = Uri.parse(urlBaseAPI + "binh-luan?KhachHangId=${Auth.khachHang.id}");
  List<SanPham> lstSanPham=[];
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List jsonRaw = json.decode(response.body);
       lstSanPham = jsonRaw.map((e) => SanPham.fromJson(e)).toList();
    }
  } catch (_) {}
  return lstSanPham;
}
