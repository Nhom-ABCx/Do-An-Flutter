import 'package:flutter/material.dart';
import '../../all_page.dart';

class IpadPage extends StatefulWidget {
  const IpadPage({Key? key}) : super(key: key);

  @override
  _IpadPageState createState() => _IpadPageState();
}

class _IpadPageState extends State<IpadPage> {
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
                titlePageCategory("IPAD"),
                buildListSanPham(context, api_SanPham_LoaiSanPham(5))
              ],
            ),
          ),
          //Footer
          bottomNavigationBar: const BottomNavBar(0)),
    );
  }
}
