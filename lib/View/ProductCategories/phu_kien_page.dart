import 'package:flutter/material.dart';
import '../../all_page.dart';

class AccessoryPage extends StatefulWidget {
  const AccessoryPage({Key? key}) : super(key: key);

  @override
  _AccessoryPageState createState() => _AccessoryPageState();
}

class _AccessoryPageState extends State<AccessoryPage> {
  late Future<List<SanPham>> apiSanPhamLoaiSanPham;
  @override
  void initState() {
    super.initState();
    apiSanPhamLoaiSanPham = api_SanPham_LoaiSanPham(6);
  }

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
              children: [titlePageCategory("Accessory"), buildListSanPham(context, apiSanPhamLoaiSanPham)],
            ),
          ),
          //Footer
          bottomNavigationBar: const BottomNavBar(0)),
    );
  }
}
