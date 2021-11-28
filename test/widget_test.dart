// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  Future<List<Province>> getAllProvince(
      {required Function(String) onError}) async {
    String endpoint = "https://vapi.vnappmob.com/api/province/";
    List<Province> province = List.empty();
    http.Response response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw["results"];
        data.forEach((element) {
          province.add(Province.fromJson(element));
        });
      } catch (e) {
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
    return province;
  }

  List<Province> province =
      await getAllProvince(onError: (msg) => print(msg)) as List<Province>;

//   String jsonString = '''
// {
//   "a": "g",
//   "b": "h",
//   "c": "j",
//   "d": "k"
// }''';

//   Map<String, String> map = Map.castFrom(json.decode(jsonString));
//   print(map);
}

class SanPham {
  // ignore: non_constant_identifier_names
  String TenSanPham;
  // ignore: non_constant_identifier_names
  String HinhAnh;

//gan` nhu phuong thuc khoi tao
  SanPham({
    // ignore: non_constant_identifier_names
    required this.TenSanPham,
    // ignore: non_constant_identifier_names
    required this.HinhAnh,
  });

  factory SanPham.fromJson(Map<String, dynamic> data) {
    return SanPham(TenSanPham: data["TenSanPham"], HinhAnh: data["HinhAnh"]);
  }
  List<SanPham> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<SanPham>((json) => SanPham.fromJson(json)).toList();
  }

  Future<List<SanPham>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/SanPham'));
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}

class Province {
  final String id;
  final String name;
  final String type;
  Province(this.id, this.name, this.type);
  Province.fromJson(Map<String, dynamic> json)
      : this.id = json['province_id'],
        this.name = json['province_name'],
        this.type = json['province_type'];
  Map<String, dynamic> toJson() => {
        'province_id': this.id,
        'province_name': this.name,
        'province_type': this.type,
      };
}
