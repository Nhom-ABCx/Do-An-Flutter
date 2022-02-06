import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../all_page.dart';

class GioHangController extends ChangeNotifier {
  List<GioHang> gioHang = [];
  int tongTien = 0;
  int tongSoLuong = 0;

  int i = 0;
  Future<List<GioHang>> getData() async {
    print("get GioHang $i");
    gioHang = await api_Get_GioHang(Auth.khachHang.id!).then((value) {
      int tt = 0;
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
              ? ListView.builder(
                  shrinkWrap: true,
                  //ngan chan ListView no' cuon xuong' duoc, xai` cho SingleChildScrollView-column
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ), // Set rounded corner radius
                        width: MediaQuery.of(context).size.width,
                        height: 125,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: 130,
                              child: CachedNetworkImage(
                                imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/" + snapshot.data![index].sanPham.hinhAnh!,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                            //bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  RichText(
                                      text: TextSpan(style: const TextStyle(color: Colors.black), text: snapshot.data![index].sanPham.tenSanPham)),
                                  Text(
                                    snapshot.data![index].id.toString(),
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  Row(
                                    children: [
                                      Text(formatNumber.format(snapshot.data![index].sanPham.giaBan),
                                          style: const TextStyle(fontWeight: FontWeight.bold)),
                                      const Spacer(),
                                      Text("Quantily: ${snapshot.data![index].soLuong}", style: const TextStyle(fontWeight: FontWeight.bold))
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                      const Divider(height: 5)
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
