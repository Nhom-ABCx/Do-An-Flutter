// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/all_page.dart';

class MyWishlistPage extends StatefulWidget {
  const MyWishlistPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyWishlistPageState();
}

enum wishList { Grid, List }

class MyWishlistPageState extends State<MyWishlistPage> {
  wishList _wishList = wishList.Grid;

  @override
  Widget build(BuildContext context) => Consumer<ChangeLayOut>(
      builder: (context, clt, child) => GestureDetector(
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
              drawer: const NavigationDrawer(),
              //Body
              body: RefreshIndicator(
                onRefresh: () async {
                  //reload
                  // ignore: invalid_use_of_protected_member
                  (context as Element).reassemble();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          children: [
                            const Text("Your Wishlist ()", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            IconButton(
                              icon: Icon(
                                Icons.grid_view,
                                color: _wishList == wishList.Grid ? Colors.red : null,
                              ),
                              onPressed: () {
                                setState(() => _wishList = wishList.Grid);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.view_list,
                                color: _wishList == wishList.List ? Colors.red : null,
                              ),
                              onPressed: () {
                                setState(() => _wishList = wishList.List);
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.refresh,
                              ),
                              // ignore: invalid_use_of_protected_member
                              onPressed: () => (context as Element).reassemble(),
                            ),
                          ],
                        ),
                      ),
                      buildListSanPham(context, api_Get_YeuThich(Auth.khachHang.id!)),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: const BottomNavBar(3),
            ),
          ));
}
