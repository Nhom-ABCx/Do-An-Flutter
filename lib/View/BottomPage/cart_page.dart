import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_application_1/cart/cart_model.dart';
import 'package:flutter_application_1/cart/cart_provider.dart';
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
    final cart=Provider.of<CartProvider>(context);
    return GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
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
            child:Column(children: [
              FutureBuilder(
                future: cart.getData(),
                builder: (context,AsyncSnapshot<List<CartModel>> snapshot){
                    if (snapshot.hasError) {
                      return Center(child:Text(snapshot.error.toString()));
                    }
                    return snapshot.hasData
                    ? 
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.all(5.0),
                              child:  Image.asset("images/product-image/"+snapshot.data![index].productImg.toString()),
                            ))
                    :const Center(
                      child: CircularProgressIndicator(),
                    );
              })
            ],) ,
          ),
          bottomNavigationBar: const BottomNavBar(2),
        ));
  }
}
