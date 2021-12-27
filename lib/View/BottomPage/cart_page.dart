import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_application_1/cart/cart_model.dart';
import 'package:flutter_application_1/cart/cart_provider.dart';
import 'package:flutter_application_1/cart/db/db_cart.dart';
import 'package:provider/provider.dart';
import '../../all_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Consumer<CartProvider>(
          builder: (context,crtpvd,child)=> Scaffold(
            //TopHeader
            appBar: AppBar(
              title: const Align(
                alignment: Alignment.center,
                child: Text(
                  "My Cart",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            //Hide
            //drawer:  NavigationDrawer(),
            //Body
            body: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                      future: cart.getData(),
                      builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        }
                        return snapshot.hasData
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) => Container(
                                    margin: const EdgeInsets.all(5.0),
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, bottom: 5.0),
                                        child: Container(
                                            color: Colors.white,
                                            child: buildCartProduct(
                                                snapshot.data![index])))))
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      })
                ],
              ),
            ),
            bottomNavigationBar: const BottomNavBar(2),
          ),
        )
          );
  }
}

Widget buildCartProduct(Cart cart) {
  DbCart db=DbCart();
  return Stack(
    children:[
      Row(
      children: [
        CachedNetworkImage(
          width: 100,
          height: 80,
          imageUrl:
              "http://10.0.2.2:8000/storage/assets/images/product-image/" +
                  cart.productImg,
        ),
        const SizedBox(
          width: 3.0,
        ),
        Container(
          height: 100,
          width: 200,
          //color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.productName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                "Giá: " + cart.productPrice.toString(),
                style: const TextStyle(
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.green,
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(Icons.remove),
              ),
              Text(cart.quantity.toString()),
              InkWell(
                onTap: () {},
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    ),
    Positioned(
      top: 3.0,
      left: 375,
      child:InkWell(
        onTap:(){
          db.deletePrdCart(cart.id!);
        } ,
        child: const Icon(Icons.cancel,color:Colors.red,
        ))
    )
    ]
  );
}
