// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import '../../all_page.dart';


// class CartPage extends StatefulWidget {
//   CartPage({Key? key, required this.sanPham}) : super(key: key);
//   SanPham sanPham;
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   get soluong => null;


 
//   @override
//   Widget build(BuildContext context) {
//        //build san pham api to cart

//      return GestureDetector(
//       //huy keyboard khi bam ngoai man hinh
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         //TopHeader
//         appBar: AppBarPage(),
//         //Hide
//         drawer: const NavigationDrawer(),
//         //Body
//         body: ListView(
//           children: [
//             Padding(
//                 padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.blueGrey.shade100,
//                       ),
//                       borderRadius:
//                           const BorderRadius.all(Radius.circular(10))),
//                 ),),
//             Padding(
//                 padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//                 child: Container(
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.blueGrey.shade100),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10))),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
//                       child: _Secsion2,
//                     ))),
//             Padding(
//                 padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//                 child: Container(
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.blueGrey.shade100),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10))),
//                     child: Padding(
//                         padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
//                         child: _Secsion3)))
//           ],
//         ),

//         bottomNavigationBar: const BottomNavBar(2),
//       ),
//     );
//   }
//      Widget buildProductCart(SanPham sp) {
//     int soLuong = 1;
//     return Row(
//       children: [
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.delete),
//         ),
//         Image(image: AssetImage('images/product-image' + sp.hinhAnh!)),
//         Column(
//           children: [
//             Text(sp.tenSanPham),
//             Text(sp.giaBan.toString()),
//           ],
//         ),
//         IconButton(
//             onPressed: () {
//               setState(() {
//                 soluong--;
//               });
//             },
//             icon: const Icon(Icons.remove)),
//         Text(soLuong.toString()),
//         IconButton(
//             onPressed: () {
//               soluong++;
//             },
//             icon: const Icon(Icons.add)),
//       ],
//     );
// }

// }




//  Widget _Secsion2 = Column(
//       crossAxisAlignment: CrossAxisAlignment.baseline,
//       textBaseline: TextBaseline.alphabetic,
//       children: [
//         const Text('Have a coupon?',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15)),
//         const Text('Enter your coupon code here & get awesome discounts!',
//             style: TextStyle(
//               color: Colors.white12,
//               fontWeight: FontWeight.bold,
//             )),
//         Padding(
//             padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//             child: Row(
//               children: [
//                 const SizedBox(
//                   width: 270,
//                   height: 50,
//                   child: TextField(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(), hintText: 'SUHA30')),
//                 ),
//                 ElevatedButton(
//                     onPressed: () {},
//                     child: const Text('Apply',
//                         style: TextStyle(
//                           color: Colors.white,
//                         )),
//                     style: ElevatedButton.styleFrom(
//                         shape: const BeveledRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(5),
//                           bottomRight: Radius.circular(5)),
//                     )))
//               ],
//             ))
//       ],
//     );
// // ignore: non_constant_identifier_names
//     final Widget _Secsion3 = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text('38.84'),
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text('Checkout Now',
//               style: TextStyle(color: Colors.black38)),
//           style: ElevatedButton.styleFrom(
//               primary: Colors.yellow.shade800,
//               shape: const BeveledRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(5))),
//               onPrimary: Colors.blue.shade800),
//         )
//       ],
//     );