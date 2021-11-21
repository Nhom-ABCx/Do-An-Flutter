import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../Pages/all_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(),
          //Hide
          drawer: const NavigationDrawer(),
          //Body
          body: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueGrey.shade100,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: _Secsion1,
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey.shade100),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
                        child: _Secsion2,
                      ))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey.shade100),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: _Secsion3)))
            ],
          ),
          bottomNavigationBar: const BottomNavBar(2),
        ),
      );
}

// ignore: non_constant_identifier_names
Widget _Secsion1 = Column(
  children: [
    const SizedBox(height: 10),
    _buildItems(
        image: 'images/product-image/DT/DT_5.jpg',
        txtNameProduct: 'Ciramic Pot Set',
        txtTotal: "12.10x1",
        amount: '1'),
    const SizedBox(height: 10),
    const Divider(
      color: Colors.white,
    ),
    const SizedBox(height: 10),
    _buildItems(
        image: 'images/product-image/DT/DT_2.jpg',
        txtNameProduct: 'Bluetooth Speaker',
        txtTotal: "9.87x2",
        amount: '2'),
    const SizedBox(height: 10),
    const Divider(
      color: Colors.white,
    ),
    const SizedBox(height: 10),
    _buildItems(
        image: 'images/product-image/DT/DT_3.jpg',
        txtNameProduct: 'Modern Gray Tops',
        txtTotal: "7x1",
        amount: '1'),
    const SizedBox(height: 10),
  ],
);
Widget _buildItems(
    {required String image,
    required String txtNameProduct,
    required String txtTotal,
    required String amount}) {
  var icon = IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.cancel_outlined,
        color: Colors.red,
      ));
  final txtAmountController = TextEditingController();
  txtAmountController.text = amount;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      icon,
      Image.asset(
        image,
        width: 50,
        height: 50,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
        children: [
          Text(txtNameProduct,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white)),
          Text(txtTotal, style: const TextStyle(color: Colors.white70))
        ],
      ),
      SizedBox(
          width: 50,
          height: 20,
          child: TextField(
            showCursor: true,
            controller: txtAmountController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: txtAmountController.text,
            ),
          ))
    ],
  );
}

// ignore: non_constant_identifier_names
Widget _Secsion2 = Column(
  crossAxisAlignment: CrossAxisAlignment.baseline,
  textBaseline: TextBaseline.alphabetic,
  children: [
    const Text('Have a coupon?',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
    const Text('Enter your coupon code here & get awesome discounts!',
        style: TextStyle(
          color: Colors.white12,
          fontWeight: FontWeight.bold,
        )),
    Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          children: [
            const SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'SUHA30')),
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text('Apply',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(
                    shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                )))
          ],
        ))
  ],
);
// ignore: non_constant_identifier_names
Widget _Secsion3 = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text('38.84'),
    ElevatedButton(
      onPressed: () {},
      child:
          const Text('Checkout Now', style: TextStyle(color: Colors.black38)),
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow.shade800,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          onPrimary: Colors.blue.shade800),
    )
  ],
);
