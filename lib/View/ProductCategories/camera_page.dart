import 'package:flutter/material.dart';
import '../../all_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
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
                titlePageCategory("Camera"),
                buildListSanPham(context, api_SanPham_LoaiSanPham(4))
              ],
            ),
          ),
          //Footer
          bottomNavigationBar: const BottomNavBar(0)),
    );
  }
}