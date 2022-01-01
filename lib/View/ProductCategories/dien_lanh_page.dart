import 'package:flutter/material.dart';
import '../../all_page.dart';

class DienLanhPage extends StatefulWidget {
  const DienLanhPage({Key? key}) : super(key: key);

  @override
  _DienLanhPageState createState() => _DienLanhPageState();
}

class _DienLanhPageState extends State<DienLanhPage> {
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
              children: [
                titlePageCategory("Refrigeration"),
                buildListSanPham(context, api_SanPham_LoaiSanPham(1))
              ],
            ),
          ),
          //Footer
          bottomNavigationBar: const BottomNavBar(0)),
    );
  }
}
