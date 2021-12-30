import 'package:flutter/material.dart';
import '/all_page.dart';

class MyWishlistPage extends StatefulWidget {
  const MyWishlistPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyWishlistPageState();
}

class MyWishlistPageState extends State<MyWishlistPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(
            title: const Text(
              "My Wishlist",
              style: TextStyle(color: Colors.black),
            ),
          ),
          // //Hide
          // drawer: const NavigationDrawer(),
          //Body
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("data"), Text("data")],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
