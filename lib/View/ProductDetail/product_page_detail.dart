// ignore_for_file: prefer_const_constructors



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Modals/cart_model.dart';
import 'package:flutter_application_1/Controller/cart_provider.dart';
import 'package:flutter_application_1/DB/db_cart.dart';
import 'package:provider/provider.dart';
import '../../all_page.dart';

// ignore: must_be_immutable
class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key, required this.sanPham}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  SanPham sanPham;

  _sanPhamImg(SanPham sanPham) {
    return SizedBox(
      child: CachedNetworkImage(
          height: 150,
          imageUrl:
              'http://10.0.2.2:8000/storage/assets/images/product-image/' +
                  sanPham.hinhAnh!),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width, height;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //TopHeader
        appBar: AppBarPage(),
        //Hide
        drawer: const NavigationDrawer(),
        body: Stack(
          children: [
            ListView(
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(90),
                      )),
                  child: FutureBuilder(
                      future: fetchProductData(sanPham.id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          // ignore: avoid_print
                          print(snapshot.error);
                        }
                        return snapshot.hasData
                            ? _sanPhamImg(sanPham)
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Container(
                    height: 130,
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50))),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 0, 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildProductData(sanPham),
                          ],
                        )),
                  ),
                ),
                buildTimeSale(),
                const SizedBox(
                  height: 10.0,
                ),
                buildStockProduct(context, sanPham),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Decription product',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
                      ),
                      SizedBox(height:10.0),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Text(sanPham.moTa!),
                      )
                    ],
                  ),
                )
                
              ],
            ),
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
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        sanPham.tenSanPham,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 5),
      Text(
        'Giá: ' + sanPham.giaBan.toString(),
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.red),
      ),
      const SizedBox(height: 5),
      Text(
        sanPham.moTa.toString(),
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16.0,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        "còn: " + sanPham.soLuongTon.toString(),
        style: TextStyle(
          color: Colors.red,
          fontSize: 16.0,
        ),
      ),
    ],
  );
}

Widget buildTimeSale() {
  return Container(
    margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
    height: 50,
    decoration: BoxDecoration(color: Colors.white),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.bolt_outlined),
            Text('Flash sale end in')
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "15d 22h 53m 23s",
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    ),
  );
}

Widget buildStockProduct(BuildContext context, SanPham sanPham) {
  DbCart dbCart = DbCart();
  final cartprd = Provider.of<CartProvider>(context);
   //cartprd.setQuantity();
  Row stock = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ElevatedButton(
          onPressed: () {
            cartprd.removeQuantity();
          },
          child: Icon(Icons.remove,color: Colors.white,size: 20,),
          ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0),
        child:Text(cartprd.getQuantity().toString()),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: ElevatedButton(
          onPressed: () {
           cartprd.addQuantity();
          },
          //clipBehavior: Clip.antiAlias,
          child: Icon(Icons.add,color:Colors.white,size: 20.0,) )
        ),
      
    ],
  );
  return Container(
    height: 50,
    decoration: BoxDecoration(color: Colors.white),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      stock,
      // ignore: deprecated_member_use
      FlatButton(
          textColor: Colors.white,
          color: Colors.red,
          onPressed: ()  async{
            final crt=Cart(
              id: sanPham.id,
                productId: sanPham.id!,
                productName: sanPham.tenSanPham,
                inintPrice: sanPham.giaBan!,
                productPrice: sanPham.giaBan!,
                quantity: cartprd.getQuantity(),
                productImg: sanPham.hinhAnh!
            );
            bool check= await dbCart.ifPrdExits(crt);
             if (check)  {
                     thongBaoScaffoldMessenger(context, "Product exits cart");
                     dbCart.updateQuantity(crt);
              cartprd.addTotalPrice(double.parse(crt.productPrice.toString()));
             }
             else{
                dbCart.insertItems(crt).then((value) {
                thongBaoScaffoldMessenger(context, "Add cart complete");
                cartprd.addTotalPrice(double.parse(sanPham.giaBan.toString()));
              }).onError((error, stackTrace) {
                print(error.toString());
              });
             }
            // int newPrice=sanPham.giaBan!*cartprd.getQuantity();
            // dbCart
            //     .insertItems(Cart(
            //       id: sanPham.id,
            //       productId: sanPham.id!,
            //         productName: sanPham.tenSanPham,
            //         inintPrice: sanPham.giaBan!,
            //         productPrice: newPrice,
            //         quantity: cartprd.getQuantity(),
            //         productImg: sanPham.hinhAnh!))
            //     .then((value) {
            //   thongBaoScaffoldMessenger(context, "Add cart complete");
            //   cartprd.addTotalPrice(double.parse(newPrice.toString()));
            // }).onError((error, stackTrace) {
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
// Widget buildSanPhamLienQuan() {
//   return Container(
//     height: 200,
//     child: FutureBuilder<List<SanPham>>(
//         future: fetchSanPhamDienThoai(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             // ignore: avoid_print
//             print(snapshot.error);
//           }
//           return snapshot.hasData
//               ? GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                   ),
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) =>
//                       buildItem(context, snapshot.data![index]),
//                 )
//               : const CircularProgressIndicator();
//         }),
//   );
// }
