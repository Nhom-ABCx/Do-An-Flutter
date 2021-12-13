import 'package:flutter/material.dart';
import '/all_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

//trang nay la layout de copy custom, ko co xai`
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(),
          //Hide
          drawer: const NavigationDrawer(),
          //Body
          body: Container(),
          //nho' thay doi? lai con so' truyen du~ lieu
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
