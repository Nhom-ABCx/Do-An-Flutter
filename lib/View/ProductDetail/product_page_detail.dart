import 'package:flutter/material.dart';
import '../../all_page.dart';

// ignore: must_be_immutable
class ProductDetail extends StatelessWidget {
    ProductDetail({Key? key, required this.sanPham}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  SanPham sanPham;
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
          body: FutureBuilder(
            future: fetchProductData(sanPham.id.toString()),
            builder: (context,snapshot){
              if (snapshot.hasError) {
                // ignore: avoid_print
                print(snapshot.error);
              }
              return snapshot.hasData?
              buildProductData(sanPham):
              const CircularProgressIndicator();
            }),
           //Footer
          bottomNavigationBar: const BottomNavBar(0)
      ),
     
      );
  }
}

Widget buildProductData(SanPham sanPham){
  return Container(
    color: Colors.white70,
    child: ListView(
      children: [
        SizedBox(
          width: 250,
          height: 300,
          child:Padding(padding: const EdgeInsets.all(10.0),
          child:Image.asset('images/product-image/'+sanPham.hinhAnh!,
        width: 200,
        height: 280,
        fit: BoxFit.contain,), 
          ) 
          
        ),
       
        Text(sanPham.tenSanPham,style:const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
         Text(sanPham.giaBan.toString(),style:const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),)
      ],
    ),
  );
}