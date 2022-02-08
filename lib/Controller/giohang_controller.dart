import 'package:flutter/material.dart';
import 'package:flutter_application_1/DB/database_mb.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../all_page.dart';

class GioHangController extends ChangeNotifier {
  List<GioHang> gioHang = [];
  double tongTien = 0;
  int tongSoLuong = 0;

  int i = 0;
  Future<List<GioHang>> getData() async {
    print("get GioHang $i");
    gioHang = await api_Get_GioHang(Auth.khachHang.id!).then((value) {
      double tt = 0;
      int tsl = 0;
      for (var item in value) {
        tt += item.soLuong * item.sanPham.giaBan!;
        tsl += item.soLuong;
      }
      tongTien = tt;
      tongSoLuong = tsl;
      return value;
    });
    i++;
    return gioHang;
  }

  void addData(BuildContext context, int sanPhamId, int soLuong) async {
    showCustomLoadding();

    //lay du lieu ve`
    final validate = await api_Insert_SanPham_GioHang(Auth.khachHang.id!, sanPhamId, soLuong);

    //neu' no' tra ve thuoc kieu du lieu bool, va` = true thi` them thanh` cong
    if ((validate is bool) && (validate == true)) {
      thongBaoScaffoldMessenger(context, "Add Success");
      EasyLoading.dismiss();
    } else {
      validate.forEach((key, value) {
        final error = value.toString() != "null" ? value.toString() : "";
        (thongBaoScaffoldMessenger(context, "Fails Add $error"));
      });
      EasyLoading.dismiss();
    }
    notifyListeners();
  }

  void updateData(BuildContext context, int sanPhamId, int soLuong) async {
    //lay du lieu ve`
    final validate = await api_Update_SanPham_GioHang(Auth.khachHang.id!, sanPhamId, soLuong);

    //neu ko tra ve kieu bool thi` tuc' co' loi~ tu` sv, xuat loi~ do' ra
    if ((validate is! bool)) {
      validate.forEach((key, value) {
        final error = value.toString() != "null" ? value.toString() : "";
        (thongBaoScaffoldMessenger(context, "Fails $error"));
      });
    }

    notifyListeners();
  }

  void deleteData(BuildContext context, int sanPhamId) async {
    showCustomLoadding();

    if (await api_Delete_SanPham_GioHang(Auth.khachHang.id!, sanPhamId)) {
      thongBaoScaffoldMessenger(context, "Delete Success");
      EasyLoading.dismiss();
    } else {
      (thongBaoScaffoldMessenger(context, "Fails Delete"));
      EasyLoading.dismiss();
    }
    notifyListeners();
  }

  Widget buildListGioHang() {
    return FutureBuilder<List<GioHang>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return snapshot.hasData
              ? ListView.separated(
                  shrinkWrap: true,
                  //ngan chan ListView no' cuon xuong' duoc, xai` cho SingleChildScrollView-column
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) => const Divider(height: 5),
                  itemBuilder: (context, index) => buildItemGioHang(
                      context: context,
                      tenSanPham: snapshot.data![index].sanPham.tenSanPham,
                      hinhAnh: snapshot.data![index].sanPham.hinhAnh!,
                      moTa: snapshot.data![index].sanPham.moTa,
                      giaBan: snapshot.data![index].sanPham.giaBan,
                      soLuong: snapshot.data![index].soLuong),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  Future<dynamic> getItemGH(int sanPhamId) async {
    final dbclient = await Db().database;
    List<Map> result = await dbclient.rawQuery("SELECT * FROM gio_hangs WHERE SanPhamId=?", [sanPhamId]);

    if (result.isNotEmpty) {
      return GioHang.fromJson(result.first);
    }
    return false;
  }

  Future<List<GioHang>> getAllItemsGH() async {
    print("get GioHang $i");
    final dbclient = await Db().database;
    final result = await dbclient.query("gio_hangs");
    gioHang = result.map((json) => GioHang.fromJson(json)).toList();

    double tt = 0;
    int tsl = 0;
    for (var item in gioHang) {
      tt += item.soLuong * item.sanPham.giaBan!;
      tsl += item.soLuong;
    }
    tongTien = tt;
    tongSoLuong = tsl;

    i++;
    return gioHang;
  }

  void insertItemGH(BuildContext context, GioHang gioHang) async {
    showCustomLoadding();

    final dbclient = await Db().database;
    final _gh = await getItemGH(gioHang.sanPhamId);
    if (_gh is GioHang) //neu' no' tra ve duoc gio? hang` thi`cap nhat so' luong len
    {
      _gh.soLuong += 1;
      if (await updateItemGH(_gh)) {
        thongBaoScaffoldMessenger(context, "Add Success");
        EasyLoading.dismiss();
      }
    } else {
      final result = await dbclient.insert('gio_hangs', gioHang.toJson());
      if (result != 0) {
        thongBaoScaffoldMessenger(context, "Add Success");
        EasyLoading.dismiss();
      } else {
        thongBaoScaffoldMessenger(context, "Add Fails");
        EasyLoading.dismiss();
      }
    }
    notifyListeners();
  }

  Future<bool> updateItemGH(GioHang gioHang) async {
    var dbclient = await Db().database;
    final result = await dbclient.update(
      'gio_hangs',
      gioHang.toJson(),
      where: 'SanPhamId=?',
      whereArgs: [gioHang.sanPhamId],
    );
    notifyListeners();
    return result != 0;
  }

  void deleteItemGH(BuildContext context, int sanPhamId) async {
    showCustomLoadding();

    final dbclient = await Db().database;
    final result = await dbclient.delete('gio_hangs', where: 'SanPhamId=?', whereArgs: [sanPhamId]);
    if (result != 0) {
      thongBaoScaffoldMessenger(context, "Delete Success");
      EasyLoading.dismiss();
    } else {
      (thongBaoScaffoldMessenger(context, "Fails Delete"));
      EasyLoading.dismiss();
    }
    notifyListeners();
  }

  Future<bool> deleteAllCart() async {
    var dbclient = await Db().database;
    final result = await dbclient.delete('gio_hangs');
    notifyListeners();
    return result != 0;
  }
}
