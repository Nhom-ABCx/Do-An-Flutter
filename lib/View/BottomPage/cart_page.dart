import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../all_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  
  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  int soluong = 0;

  @override

  //Widget product to cart
  Widget buildProductCart(SanPham sp ){
    int soLuong=0;
    return Row(
      children:[
          IconButton(onPressed: (){},
           icon: const Icon(Icons.cancel_outlined,color: Colors.red,)),
          Image(image: AssetImage("images/product-image/"+sp.hinhAnh!)),
          Column(
            children: [
              Text(sp.tenSanPham),
              Text(sp.giaBan.toString())
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: ()=>soluong--, icon: const Icon(Icons.remove)),
              Text(soLuong.toString()),
              IconButton(onPressed: ()=>soLuong++, icon: const Icon(Icons.add))
            ],
          )
      ]
    );
  }
  Widget build(BuildContext context) {
    Widget _buildItems(
        {required String image,
        required String txtNameProduct,
        required String txtTotal,
        required String amount}
        ) {
      final txtAmountController = TextEditingController();
      txtAmountController.text = amount;
      var icon = IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cancel_outlined,
            color: Colors.red,
          ));
      var iconadd = IconButton(
          onPressed: () => setState(() => soluong++),
          icon: const Icon(
            Icons.add,
            color: Colors.red,
          ));
      var iconmove = IconButton(
          onPressed: () => setState(() => soluong--),
          icon: const Icon(
            Icons.remove,
            color: Colors.red,
          ));

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
                      fontWeight: FontWeight.bold, color: Colors.black)),
              Text(txtTotal, style: const TextStyle(color: Colors.black)),
            ],
          ),
          Padding(padding: const EdgeInsets.only(right: 20.0)),
          iconadd,
          SizedBox(
            width: 50,
            height: 25,
            child: TextField(
              showCursor: true,
              //controller: txtAmountController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: txtAmountController.text,
              ),
            ),
          ),
          iconmove,
        ],
      );
    }

  _sanPhamImg(SanPham sanPham)
  {
    return SizedBox(
        child: Image(
            height: 200,
            image: AssetImage('images/product-image/' + sanPham.hinhAnh!)),
      );
  }
// ignore: non_constant_identifier_names
    final Widget _Secsion1 = Row(
      children: [
         SizedBox(height: 10),
        _buildItems(
            image: 'images/product-image/',
            txtNameProduct: 'Ciramic Pot Set',
            txtTotal: "12.10x1",
            amount: soluong.toString()),
      ],
    );
// ignore: non_constant_identifier_names
    final Widget _Secsion2 = Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Text('Have a coupon?',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
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
                  width: 270,
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
    final Widget _Secsion3 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('38.84'),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Checkout Now',
              style: TextStyle(color: Colors.black38)),
          style: ElevatedButton.styleFrom(
              primary: Colors.yellow.shade800,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              onPrimary: Colors.blue.shade800),
        )
      ],
    );

    return GestureDetector(
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
}
