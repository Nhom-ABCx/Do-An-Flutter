import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContainerController extends GetxController {
  final List<Widget> widgetPage = [
    //const HomePage(),
    //const DonHangPage(),
    const Center(child: Text("Sản phẩm page")),
    const Center(child: Text("Sản phẩm page")),
    const Center(child: Text("Sản phẩm page")),
    const Center(child: Text("Sản phẩm page")),
    //const SettingPage(),
  ];

  RxInt currentIndexBottomNav = 0.obs;
}
