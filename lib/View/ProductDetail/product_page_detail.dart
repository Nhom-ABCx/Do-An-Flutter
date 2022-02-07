// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/binh_luan_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../all_page.dart';

// ignore: must_be_immutable
class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key, required this.sanPham}) : super(key: key);
  SanPham sanPham;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  // _sanPhamImg(SanPham sanPham) {
  //   return SizedBox(
  //     child: CachedNetworkImage(height: 150, imageUrl: 'http://10.0.2.2:8000/storage/assets/images/product-image/' + sanPham.hinhAnh!),
  //   );
  // }

  createNewComment(BuildContext context, int sanPhamId) {
    final commentController = TextEditingController();
    final binhLuanController = Provider.of<BinhLuanController>(context, listen: false);

    return showDialog(
        //barrierDismissible: false, //ko cho nhap ra ngoai
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add comment"),
              content: TextField(
                autofocus: true, //tu dong hien cai ban`phim'
                controller: commentController, //gan gia tri cua text vao bien'
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                ),
                // validator: (value) => snapshot.hasError ? snapshot.error.toString() : null,
              ),
              // ),
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
                        Navigator.pop(context);
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

  int soLuongMuonChon = 0;
  @override
  Widget build(BuildContext context) {
    // double width, height;
    // height = MediaQuery.of(context).size.height;
    // width = MediaQuery.of(context).size.width;

    //dem len day de no co setstate cho le
    Widget _buildStockProduct(BuildContext context, SanPham sanPham) {
      final gioHangController = Provider.of<GioHangController>(context, listen: false);

      Row stock = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ElevatedButton(
              onPressed: () {
                //gioHang
                if (soLuongMuonChon < 1) return;
                setState(() => soLuongMuonChon -= 1);
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
            child: Text("$soLuongMuonChon"),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: ElevatedButton(
                  onPressed: () {
                    //gioHang
                    setState(() => soLuongMuonChon += 1);
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
                //gioHang
                // final crt = Cart(
                //     id: sanPham.id,
                //     productId: sanPham.id!,
                //     productName: sanPham.tenSanPham,
                //     inintPrice: sanPham.giaBan!,
                //     productPrice: (cartprd.getQuantity() * sanPham.giaBan!),
                //     quantity: cartprd.getQuantity(),
                //     productImg: sanPham.hinhAnh!);
                // bool check = await dbCart.ifPrdExitsCart(crt);
                // if (check) {
                //   thongBaoScaffoldMessenger(context, "Product exits cart");
                //   dbCart.updateQuantity(crt);
                //   cartprd.addTotalPrice(double.parse(crt.productPrice.toString()));
                // } else {
                //   dbCart.insertItemCart(crt).then((value) {
                //     thongBaoScaffoldMessenger(context, "Add cart complete");
                //     cartprd.addTotalPrice(double.parse(sanPham.giaBan.toString()));
                //   }).onError((error, stackTrace) {
                //     // ignore: avoid_print
                //     print(error.toString());
                //   });
                // }
                // int newPrice = sanPham.giaBan! * cartprd.getQuantity();
                // dbCart
                //     .insertItemCart(Cart(
                //         id: sanPham.id,
                //         productId: sanPham.id!,
                //         productName: sanPham.tenSanPham,
                //         inintPrice: sanPham.giaBan!,
                //         productPrice: newPrice,
                //         quantity: cartprd.getQuantity(),
                //         productImg: sanPham.hinhAnh!))
                //     .then((value) {
                //   thongBaoScaffoldMessenger(context, "Add cart complete");
                //   cartprd.addTotalPrice(double.parse(newPrice.toString()));
                // }).onError((error, stackTrace) {
                //   // ignore: avoid_print
                //   print(error.toString());
                // });
                // ;
              },
              child: Text(
                'Add to card',
                style: TextStyle(),
              ))
        ]),
      );
    }

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
                child: CachedNetworkImage(
                  imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/" + widget.sanPham.hinhAnh!,
                  width: 100,
                  height: 120,
                  placeholder: (context, url) => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
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
                        children: [buildProductData(widget.sanPham)],
                      )),
                ),
              ),
              buildTimeSale(),
              _buildStockProduct(context, widget.sanPham),
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
                      child: Text(widget.sanPham.moTa!),
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
                          future: api_Kiem_Tra_Auth_BinhLuan(widget.sanPham.id!),
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
                                      await createNewComment(context, widget.sanPham.id!);
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
                      future: binhluanController.getData(widget.sanPham.id!),
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
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                    // boxShadow: const [
                                    //   BoxShadow(
                                    //     blurRadius: 3,
                                    //     color: Color(0x41000000),
                                    //     offset: Offset(0, 1),
                                    //   )
                                    // ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: snap.data![index].hinhAnhKh!,
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
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(snap.data![index].userName!),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                  child: Text(snap.data![index].noiDung!),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: const [
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                        child: Text('Posted'),
                                                      ),
                                                      Text('A few moments ago'),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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

Widget buildProductData(SanPham sanPham) {
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
    Row(
      children: [
        RatingBarIndicator(
            rating: sanPham.star!,
            itemSize: 30.0,
            itemBuilder: (context, index) {
              return const Icon(
                Icons.star,
                color: Colors.amber,
              );
            }),
        Text(
          "${sanPham.star} ratings",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
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
