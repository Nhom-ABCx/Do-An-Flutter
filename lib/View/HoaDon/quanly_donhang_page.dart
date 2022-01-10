import 'package:flutter/material.dart';
import '/all_page.dart';

class QuanLyDonHangPage extends StatefulWidget {
  const QuanLyDonHangPage({Key? key}) : super(key: key);
  @override
  _QuanLyDonHangPageState createState() => _QuanLyDonHangPageState();
}

//trang nay la layout de copy custom, ko co xai`
class _QuanLyDonHangPageState extends State<QuanLyDonHangPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    //tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TopHeader
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.indigo),
        title: const Text(
          "My orders",
          style: TextStyle(color: Colors.indigo),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          labelStyle: const TextStyle(fontSize: 20),
          isScrollable: true,
          tabs: const [
            Tab(
              text: "To Pay",
            ),
            Tab(
              text: "To Ship",
            ),
            Tab(
              text: "To Receive",
            ),
            Tab(
              text: "To Review",
            ),
          ],
        ),
      ),
      //Hide
      //drawer: const NavigationDrawer(),
      //Body
      body: TabBarView(
        controller: tabController,
        children: [
          ToPayTab(
            TrangThai: 0,
            check: false,
          ),
          ToPayTab(
            TrangThai: 1,
            check: false,
          ),
          ToPayTab(
            TrangThai: 2,
            check: false,
          ),
          ToPayTab(
            TrangThai: 2,
            check: true,
          ),
        ],
      ),
      //nho' thay doi? lai con so' truyen du~ lieu
      //bottomNavigationBar: const BottomNavBar(0),
    );
  }
}
