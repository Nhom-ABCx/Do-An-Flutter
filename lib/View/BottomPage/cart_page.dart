import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../Modals/cart_model.dart';
import 'package:flutter_application_1/Controller/cart_provider.dart';
import 'package:flutter_application_1/DB/db_cart.dart';
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
    DbCart dbCart = DbCart();
    final cartprd = Provider.of<CartProvider>(context);
    
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //TopHeader
        appBar: AppBar(
          title: const Text('My Cart'),
        ),
        //Hide
        drawer: const NavigationDrawer(),
        //Body
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                
               SizedBox(
                    height: 530,
                    child: FutureBuilder<List<Cart>>(
                        future: cartprd.getData(),
                        builder: (context, snap) {
                          if (snap.hasError) {
                            return Center(
                              child: Text(snap.error.toString()),
                            );
                          }
                          return snap.hasData
                              ? ListView.builder(
                                  shrinkWrap: true,
                                   physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snap.data!.length,
                                  itemBuilder: (context, index) {
                                    
                                    // ignore: unrelated_type_equality_checks
                                    //if (snap.data!.length>0) {
                                     
                                   // }
                                    return Container(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, right: 5.0, top: 5.0),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              dbCart.deleteCart(
                                                  snap.data![index].id!);
                                              cartprd.removeTotalPrice(
                                                  double.parse(snap
                                                      .data![index].productPrice
                                                      .toString()));
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
                                              imageUrl:
                                                  "http://10.0.2.2:8000/storage/assets/images/product-image/" +
                                                      snap.data![index]
                                                          .productImg),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          Container(
                                            width: 180,
                                            child: Column(
                                             
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snap.data![index].productName,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Text(
                                                  "Giá: " +
                                                      snap.data![index].inintPrice
                                                          .toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 10.0),
                                            width: 80,
                                            //color: Colors.indigo,
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                     int quantity = snap
                                                        .data![index].quantity;
                                                    int price = snap
                                                        .data![index].inintPrice;
                                                    quantity--;
                                                    int newPrice =
                                                        price * quantity;
                                                    if(quantity>0){
                                                      dbCart
                                                          .updateCart(
                                                        Cart(
                                                            id: snap
                                                                .data![index].id!,
                                                                productId: snap.data![index].productId,
                                                            productName: snap
                                                                .data![index]
                                                                .productName,
                                                            inintPrice: snap
                                                                .data![index]
                                                                .inintPrice,
                                                            productPrice:
                                                                newPrice,
                                                            quantity: quantity,
                                                            productImg: snap
                                                                .data![index]
                                                                .productImg),
                                                      )
                                                          .then((value) {
                                                        newPrice = 0;
                                                        quantity = 0;
                                                        cartprd.removeTotalPrice(
                                                            double.parse(snap
                                                                .data![index]
                                                                .inintPrice
                                                                .toString()));
                                                      }).onError((error,
                                                              stackTrace) {
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
                                                  margin: const EdgeInsets.only(
                                                      left: 5.0, right: 5.0),
                                                  child: Text(
                                                    
                                                    snap.data![index].quantity
                                                        .toString(),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    int quantity = snap
                                                        .data![index].quantity;
                                                    int price = snap
                                                        .data![index].inintPrice;
                                                    quantity++;
                                                    int newPrice =
                                                        price * quantity;
                                                    dbCart
                                                        .updateCart(
                                                      Cart(
                                                          id: snap
                                                              .data![index].id!,
                                                              productId: snap.data![index].productId,
                                                          productName: snap
                                                              .data![index]
                                                              .productName,
                                                          inintPrice: snap
                                                              .data![index]
                                                              .inintPrice,
                                                          productPrice: newPrice,
                                                          quantity: quantity,
                                                          productImg: snap
                                                              .data![index]
                                                              .productImg),
                                                    )
                                                        .then((value) {
                                                      newPrice = 0;
                                                      quantity = 0;
                                                      cartprd.addTotalPrice(
                                                          double.parse(snap
                                                              .data![index]
                                                              .inintPrice
                                                              .toString()));
                                                    }).onError(
                                                            (error, stackTrace) {
                                                      print(error.toString());
                                                    });
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
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    color: Colors.green,
                    width: 415,
                    height: 50,
                    //padding: const EdgeInsets.only(top:15.0,right: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Tổng tiền: " + cartprd.getTotalPrice().toString(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 100,
                                height: 30,
                                color: Colors.yellow[600],
                                child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Đặt hàng",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                              ),
                            ),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ]),
        ),
        //nho' thay doi? lai con so' truyen du~ lieu
        bottomNavigationBar: const BottomNavBar(2),
      ),
    );
  }
}

// Widget buildCart(BuildContext context, Cart cart) {
//   DbCart dbCart = DbCart();
//   final cartprd = Provider.of<CartProvider>(context);
//   return Container(
//     padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
//     child: Row(
//       children: [
//         InkWell(
//           onTap: () {
//             dbCart.deleteCart(cart.id!);
//             cartprd.removeTotalPrice(double.parse(cart.productPrice.toString()));
//           } ,
//           child: const Icon(
//             Icons.cancel,
//             color: Colors.red,
//           ),
//         ),
//         const SizedBox(
//           width: 10.0,
//         ),
//         CachedNetworkImage(
//             width: 100,
//             height: 100,
//             imageUrl:
//                 "http://10.0.2.2:8000/storage/assets/images/product-image/" +
//                     cart.productImg),
//         const SizedBox(
//           width: 5.0,
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               cart.productName,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//               ),
//             ),
//             Text(
//               "Giá: " + cart.productPrice.toString(),
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.red,
//               ),
//             ),
//           ],
//         ),
//         Container(
//           padding: const EdgeInsets.only(top: 20,left: 10.0),
//           width: 80,
//           //color: Colors.indigo,
//           child: Row(
//             children: [
//               InkWell(
//                 onTap: () {},
//                 child: const Icon(Icons.remove,color: Colors.red,),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 5.0,right: 5.0),
//                 child: Text(
//                   cart.quantity.toString(),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: const Icon(Icons.add,color: Colors.green,),
//               )
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
