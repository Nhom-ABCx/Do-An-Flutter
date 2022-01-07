// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/binh_luan_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_application_1/DB/database_mb.dart';
import 'package:provider/provider.dart';
import '../../all_page.dart';

// ignore: must_be_immutable
class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key, required this.sanPham}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  SanPham sanPham;

  _sanPhamImg(SanPham sanPham) {
    return SizedBox(
      child: CachedNetworkImage(height: 150, imageUrl: 'http://10.0.2.2:8000/storage/assets/images/product-image/' + sanPham.hinhAnh!),
    );
  }

  createNewComment(BuildContext context, int sanPhamId) {
    final commentController = TextEditingController();
    final binhLuanController = Provider.of<BinhLuanController>(context, listen: false);

    return showDialog(
        //barrierDismissible: false, //ko cho nhap ra ngoai
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add comment"),
              content: TextFormField(
                autofocus: true, //tu dong hien cai ban`phim'
                controller: commentController, //gan gia tri cua text vao bien'
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                ),
              ),
              actions: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      showCustomLoadding();

                      final addbl = await binhLuanController.addBinhLuan(commentController.text, sanPhamId);
                      // ignore: unrelated_type_equality_checks
                      if (addbl) {
                        thongBaoScaffoldMessenger(context, "Add Success");
                        Navigator.pop(context);
                        EasyLoading.dismiss();
                      } else {
                        (thongBaoScaffoldMessenger(context, "Fails add"));
                        //(context as Element).reassemble();
                        EasyLoading.dismiss();
                      }
                    },
                    child: const Text("Submit"),
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // double width, height;
    // height = MediaQuery.of(context).size.height;
    // width = MediaQuery.of(context).size.width;
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //TopHeader
        appBar: AppBarPage(),
        //Hide
        //drawer: const NavigationDrawer(),
        body: Stack(
          children: [
            ListView(children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(90),
                    )),
                child: FutureBuilder<SanPham>(
                    future: fetchProductData(sanPham.id.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        // ignore: avoid_print
                        print(snapshot.error);
                      }
                      return snapshot.hasData
                          ? _sanPhamImg(snapshot.data!)
                          : const Center(
                              child: CupertinoActivityIndicator(),
                            );
                    }),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Container(
                  height: 170,
                  decoration: const BoxDecoration(color: Color(0xFFD6D6D6), borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0, 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder<SanPham>(
                              future: fetchProductData(sanPham.id.toString()),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  // ignore: avoid_print
                                  print(snapshot.error);
                                }
                                return snapshot.hasData
                                    ? buildProductData(snapshot.data!)
                                    : Center(
                                        child: CupertinoActivityIndicator(),
                                      );
                              })
                        ],
                      )),
                ),
              ),
              buildTimeSale(),
              buildStockProduct(context, sanPham),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Color(0xFFD6D6D6), borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Decription product',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(sanPham.moTa!),
                    )
                  ],
                ),
              ),
              //binh luan
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Reviews',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      FutureBuilder(
                          future: api_Kiem_Tra_Auth_BinhLuan(sanPham.id!),
                          builder: (context, snap) {
                            if (snap.hasError) {
                              return Text(snap.error.toString());
                            }
                            if (snap.data == true) {
                              return Container(
                                height: 45,
                                //color:Colors.amber,
                                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                                child: TextButton(
                                    onPressed: () async {
                                      await createNewComment(context, sanPham.id!);
                                    },
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Add comment",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),
                                        ),
                                        Icon(
                                          Icons.create_sharp,
                                          size: 20,
                                          color: Colors.teal,
                                        )
                                      ],
                                    )),
                              );
                            } else {
                              return Text("");
                            }
                          })
                    ],
                  ),
                ),
              ),
              Consumer<BinhLuanController>(
                  builder: (context, binhluanController, child) => FutureBuilder<List<BinhLuan>>(
                      future: binhluanController.getData(sanPham.id!),
                      builder: (context, snap) {
                        if (snap.hasError) {
                          return Text(snap.error.toString());
                        }
                        if (snap.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snap.data!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      width: 60,
                                      height: 60,
                                      imageUrl: "http://10.0.2.2:8000/storage/assets/images/avatar/User/${snap.data![index].khachHangId}/" +
                                          snap.data![index].hinhAnhKh!,
                                      placeholder: (context, url) => const Center(
                                        child: CupertinoActivityIndicator(),
                                      ),
                                      errorWidget: (context, url, error) => const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                  title: Text(snap.data![index].userName!),
                                  subtitle: Text(snap.data![index].noiDung!),
                                );
                              });
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      })),
            ]),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(0),
      ),
    );
  }
}

Widget buildImageSanPham(SanPham sanPham) {
  return Image.asset(
    'images/product-image/' + sanPham.hinhAnh!,
    height: 280.0,
    width: 280.0,
  );
}

Widget buildProductData(SanPham sanPham) {
  //ham tra ve so sao cua san pham
  Future<double> setStar() async {
    final dsStar = await api_To_Star(sanPham.id!);
    double star = 0.0;
    double z = 1;
    int s = 0;
    if (dsStar.isNotEmpty) {
      for (var i = 0; i < dsStar.length; i++) {
        if (dsStar[i].Star != 0) {
          s += dsStar[i].Star!;
          z++;
        }
      }
    }
    if (z > 1) {
      return double.parse((s / (z - 1)).toString());
    } else {
      return star;
    }
  }

  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      sanPham.tenSanPham,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 5),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Price: " + formatNumber.format(sanPham.giaBan),
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
      ],
    ),
    const SizedBox(height: 5),
    Text(
      "Stock: " + sanPham.soLuongTon.toString(),
      style: TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 5.0,
    ),
    FutureBuilder(
      future: setStar(),
      builder: (context, snap) {
        return snap.hasData
            ? Row(
                children: [
                  RatingBarIndicator(
                      rating: double.parse(snap.data.toString()),
                      itemSize: 30.0,
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      }),
                  Text(
                    snap.data.toString() + " ratings",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            : const Text("");
      },
    )
  ]);
}

Widget buildTimeSale() {
  return Container(
    margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
    height: 50,
    decoration: BoxDecoration(color: Color(0xFFD6D6D6), borderRadius: BorderRadius.circular(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.bolt_outlined),
            Text(
              'Flash sale end in',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "15d 22h 53m 23s",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}

Widget buildStockProduct(BuildContext context, SanPham sanPham) {
  Db dbCart = Db();
  final cartprd = Provider.of<CartProvider>(context);

  Row stock = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ElevatedButton(
          onPressed: () {
            cartprd.removeQuantity();
          },
          child: Icon(
            Icons.remove,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Text(cartprd.getQuantity().toString()),
      ),
      Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: ElevatedButton(
              onPressed: () async {
                // Cart crt = Cart(
                //     id: sanPham.id,
                //     productId: sanPham.id!,
                //     productName: sanPham.tenSanPham,
                //     inintPrice: sanPham.giaBan!,
                //     productPrice: sanPham.giaBan!,
                //     quantity: 1,
                //     productImg: sanPham.hinhAnh!);
                // bool check = await dbCart.checkStocProduct(sanPham.soLuongTon!, crt);
                // if (check) {
                cartprd.addQuantity();
                // } else {
                //   thongBaoScaffoldMessenger(context, "Limited quantity");
                // }
              },
              //clipBehavior: Clip.antiAlias,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20.0,
              ))),
    ],
  );
  return Container(
    height: 50,
    decoration: BoxDecoration(color: Color(0xFFD6D6D6), borderRadius: BorderRadius.circular(10)),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      stock,

      SizedBox(
        width: 50,
      ),
      // ignore: deprecated_member_use
      FlatButton(
          textColor: Colors.white,
          color: Colors.red,
          onPressed: () async {
            final crt = Cart(
                id: sanPham.id,
                productId: sanPham.id!,
                productName: sanPham.tenSanPham,
                inintPrice: sanPham.giaBan!,
                productPrice: (cartprd.getQuantity() * sanPham.giaBan!),
                quantity: cartprd.getQuantity(),
                productImg: sanPham.hinhAnh!);
            bool check = await dbCart.ifPrdExitsCart(crt);
            if (check) {
              thongBaoScaffoldMessenger(context, "Product exits cart");
              dbCart.updateQuantity(crt);
              cartprd.addTotalPrice(double.parse(crt.productPrice.toString()));
            } else {
              dbCart.insertItemCart(crt).then((value) {
                thongBaoScaffoldMessenger(context, "Add cart complete");
                cartprd.addTotalPrice(double.parse(sanPham.giaBan.toString()));
              }).onError((error, stackTrace) {
                // ignore: avoid_print
                print(error.toString());
              });
            }
            int newPrice = sanPham.giaBan! * cartprd.getQuantity();
            dbCart
                .insertItemCart(Cart(
                    id: sanPham.id,
                    productId: sanPham.id!,
                    productName: sanPham.tenSanPham,
                    inintPrice: sanPham.giaBan!,
                    productPrice: newPrice,
                    quantity: cartprd.getQuantity(),
                    productImg: sanPham.hinhAnh!))
                .then((value) {
              thongBaoScaffoldMessenger(context, "Add cart complete");
              cartprd.addTotalPrice(double.parse(newPrice.toString()));
            }).onError((error, stackTrace) {
              // ignore: avoid_print
              print(error.toString());
            });
            ;
          },
          child: Text(
            'Add to card',
            style: TextStyle(),
          ))
    ]),
  );
}
