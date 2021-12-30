import 'package:flutter/material.dart';
import '/all_page.dart';

class QuanLyDonHangPage extends StatefulWidget {
  const QuanLyDonHangPage({Key? key}) : super(key: key);
  @override
  _QuanLyDonHangPageState createState() => _QuanLyDonHangPageState();
}

//trang nay la layout de copy custom, ko co xai`
class _QuanLyDonHangPageState extends State<QuanLyDonHangPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          //TopHeader
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.indigo),
            title: const Text(
              "TabBar",
              style: TextStyle(color: Colors.indigo),
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Tab 1",
                  icon: Icon(Icons.ac_unit),
                ),
                Tab(
                  text: "Tab 2",
                  icon: Icon(Icons.ac_unit),
                ),
                Tab(
                  text: "Tab 3",
                  icon: Icon(Icons.ac_unit),
                ),
              ],
            ),
          ),
          //Hide
          //drawer: const NavigationDrawer(),
          //Body
          body: const TabBarView(
            children: [
              Center(
                child: Text("Page 1"),
              ),
              Center(
                child: Text("Page 2"),
              ),
              Center(
                child: Text("Page 3"),
              ),
            ],
          ),
          //nho' thay doi? lai con so' truyen du~ lieu
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
