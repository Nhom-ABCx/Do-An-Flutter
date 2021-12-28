import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart/cart_model.dart';
import 'package:flutter_application_1/cart/cart_provider.dart';
import 'package:flutter_application_1/cart/db/db_cart.dart';
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
        appBar: AppBarPage(),
        //Hide
        drawer: const NavigationDrawer(),
        //Body
        body: Consumer<CartProvider>(
          builder: (context, cartprd, child) => ListView(
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartprd.getCartItems.length,
                  itemBuilder: (context, index) {
                    return buildCart(context, cartprd.getCartItems[index]);
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    "Tổng tiền: " + cartprd.gettotalPrice.toString(),
                  ),
                ]),
              )
            ],
          ),
        ),

        //nho' thay doi? lai con so' truyen du~ lieu
        bottomNavigationBar: const BottomNavBar(2),
      ),
    );
  }
}

Widget buildCart(BuildContext context, Cart cart) {
  //DbCart dbCart = DbCart();
  final cartprd = Provider.of<CartProvider>(context);
  return Container(
    padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
    child: Row(
      children: [
        InkWell(
          onTap: () => cartprd.removeItem(cart),
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
                    cart.productImg),
        const SizedBox(
          width: 5.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cart.productName),
            Text("Giá: " + cart.productPrice.toString()),
          ],
        )
      ],
    ),
  );
}
