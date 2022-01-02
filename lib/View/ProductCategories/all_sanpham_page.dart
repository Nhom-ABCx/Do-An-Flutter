import 'package:flutter/material.dart';
import '../../all_page.dart';

class AllSanPhamPage extends StatefulWidget {
  const AllSanPhamPage({Key? key}) : super(key: key);

  @override
  _AllSanPhamPageState createState() => _AllSanPhamPageState();
}

class _AllSanPhamPageState extends State<AllSanPhamPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          //TopHeader
          appBar: AppBarPage(),
          //Hide
          //drawer: const NavigationDrawer(),
          //body
          body: SingleChildScrollView(
            child: Column(
              children: [titlePageCategory("All Products"), buildListSanPham(context, api_GetAll_SanPham())],
            ),
          ),
          //Footer
          bottomNavigationBar: const BottomNavBar(0)),
    );
  }
}
