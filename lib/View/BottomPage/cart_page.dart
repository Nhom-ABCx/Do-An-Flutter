import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../all_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //TopHeader
        appBar: AppBarPage(
          title: const Text(
            "My Cart",
            style: TextStyle(color: Colors.black),
          ),
        ),
        //Hide
        drawer: const NavigationDrawer(),
        //Body
        body: Consumer<GioHangController>(
          builder: (context, gioHangController, child) => FutureBuilder<List<GioHang>>(
            future: gioHangController.getData(),
            builder: (context, snapshot) {
              {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? (snapshot.data!.isEmpty)
                        ? khongCoGiHet(context, "There are no orders place yet.", "assets/icons/cart.svg")
                        : Column(children: [
                            SizedBox(
                                height: 475,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    //ngan chan ListView no' cuon xuong' duoc, xai` cho SingleChildScrollView-column
                                    //physics: const NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () => gioHangController.deleteData(context, snapshot.data![index].sanPhamId),
                                              child: const Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            CachedNetworkImage(
                                                width: 100,
                                                height: 100,
                                                imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/" +
                                                    snapshot.data![index].sanPham.hinhAnh!),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            SizedBox(
                                              width: 160,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data![index].sanPham.tenSanPham,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Giá: ${formatNumber.format(snapshot.data![index].soLuong * snapshot.data![index].sanPham.giaBan!)}",
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(top: 20, left: 10.0),
                                              width: 80,
                                              //color: Colors.indigo,
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      int soLuong = snapshot.data![index].soLuong - 1;
                                                      //kiem tra tai client, de do~ khoi phai gui request them
                                                      if (soLuong < 1) return;
                                                      gioHangController.updateData(context, snapshot.data![index].sanPhamId, soLuong);
                                                    },
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                                                    child: Text(
                                                      "${snapshot.data![index].soLuong}",
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      gioHangController.updateData(
                                                          context, snapshot.data![index].sanPhamId, snapshot.data![index].soLuong + 1);
                                                    },
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.green,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    })),
                            Container(
                              color: Colors.green,
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              //padding: const EdgeInsets.only(top:15.0,right: 10.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                Text(
                                  "Tổng tiền: ${formatNumber.format(gioHangController.tongTien)}",
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10.0),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        gioHangController.gioHang.isNotEmpty ? Navigator.pushNamed(context, "/BillingPage") : null;
                                      },
                                      child: const Text(
                                        "Checkout Now",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          //side: const BorderSide(color: Colors.pink)
                                        )),
                                        backgroundColor: MaterialStateProperty.all(Colors.amber),
                                      )),
                                ),
                              ]),
                            ),
                          ])
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              }
            },
          ),
        ),
        //nho' thay doi? lai con so' truyen du~ lieu
        bottomNavigationBar: const BottomNavBar(2),
      ),
    );
  }
}
