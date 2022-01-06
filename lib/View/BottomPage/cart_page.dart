import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/DB/database_mb.dart';
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
    Db dbCart = Db();

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
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 475,
              child: Consumer<CartProvider>(
                builder: (context, cartprd, child) => FutureBuilder<List<Cart>>(
                    future: dbCart.getCartList(),
                    builder: (context, snap) {
                      if (snap.hasError) {
                        return Center(
                          child: Text(snap.error.toString()),
                        );
                      }
                      return snap.hasData
                          ? ListView.builder(
                              shrinkWrap: true,
                              //physics: const NeverScrollableScrollPhysics(),
                              itemCount: snap.data!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          dbCart.deleteCart(snap.data![index].id!);
                                          cartprd.removeTotalPrice(double.parse(snap.data![index].productPrice.toString()));
                                        },
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
                                          imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/" + snap.data![index].productImg),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      SizedBox(
                                        width: 160,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snap.data![index].productName,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              "Giá: ${formatNumber.format(snap.data![index].inintPrice)}",
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
                                                int quantity = snap.data![index].quantity;
                                                int price = snap.data![index].inintPrice;
                                                quantity--;
                                                int newPrice = price * quantity;
                                                if (quantity > 0) {
                                                  dbCart
                                                      .updateCart(
                                                    Cart(
                                                        id: snap.data![index].id!,
                                                        productId: snap.data![index].productId,
                                                        productName: snap.data![index].productName,
                                                        inintPrice: snap.data![index].inintPrice,
                                                        productPrice: newPrice,
                                                        quantity: quantity,
                                                        productImg: snap.data![index].productImg),
                                                  )
                                                      .then((value) {
                                                    newPrice = 0;
                                                    quantity = 0;
                                                    cartprd.removeTotalPrice(double.parse(snap.data![index].inintPrice.toString()));
                                                  }).onError((error, stackTrace) {
                                                    print(error.toString());
                                                  });
                                                }
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                                              child: Text(
                                                snap.data![index].quantity.toString(),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                // tạo biến kiểm tra sản phẩm thêm vào cart có tồn tại chưa
                                                final sp = await fetchProductData(snap.data![index].productId.toString());
                                                bool check = await dbCart.checkStocProduct(sp.soLuongTon!, snap.data![index]);
                                                if (check) {
                                                  int quantity = snap.data![index].quantity;
                                                  int price = snap.data![index].inintPrice;
                                                  quantity++;
                                                  int newPrice = price * quantity;
                                                  dbCart
                                                      .updateCart(
                                                    Cart(
                                                        id: snap.data![index].id!,
                                                        productId: snap.data![index].productId,
                                                        productName: snap.data![index].productName,
                                                        inintPrice: snap.data![index].inintPrice,
                                                        productPrice: newPrice,
                                                        quantity: quantity,
                                                        productImg: snap.data![index].productImg),
                                                  )
                                                      .then((value) {
                                                    newPrice = 0;
                                                    quantity = 0;
                                                    cartprd.addTotalPrice(double.parse(snap.data![index].inintPrice.toString()));
                                                  }).onError((error, stackTrace) {
                                                    print(error.toString());
                                                  });
                                                } else {
                                                  thongBaoScaffoldMessenger(context, "Limited quantity");
                                                }
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
                              })
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    }),
              ),
            ),
            Container(
              color: Colors.green,
              width: 415,
              height: 50,
              //padding: const EdgeInsets.only(top:15.0,right: 10.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  "Tổng tiền: ${formatNumber.format(Provider.of<CartProvider>(context).getTotalPrice())}",
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        ((await CartProvider().getData()).isNotEmpty) ? Navigator.pushNamed(context, "/BillingPage") : null;
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
          ]),
        ),
        //nho' thay doi? lai con so' truyen du~ lieu
        bottomNavigationBar: const BottomNavBar(2),
      ),
    );
  }
}
