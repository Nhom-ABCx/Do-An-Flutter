import 'package:flutter/material.dart';
import '../../all_page.dart';

class LapTopPage extends StatefulWidget {
  const LapTopPage({Key? key}) : super(key: key);

  @override
  _LapTopPageState createState() => _LapTopPageState();
}

class _LapTopPageState extends State<LapTopPage> {
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
                titlePageCategory("LapTop"),
                buildListSanPham(context, api_SanPham_LoaiSanPham(3))
              ],
            ),
          ),
          //Footer
          bottomNavigationBar: const BottomNavBar(0)),
    );
  }
}
