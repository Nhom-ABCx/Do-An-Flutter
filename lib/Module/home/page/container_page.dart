import 'package:do_an_flutter/Config/Language/translation_service.dart';
import 'package:do_an_flutter/Config/strings.dart';
import 'package:do_an_flutter/Config/theme.dart';
import 'package:do_an_flutter/Module/home/home_controller.dart';
import 'package:do_an_flutter/Widget/banner_widget.dart';
import 'package:do_an_flutter/Widget/item_product_widget.dart';
import 'package:do_an_flutter/Widget/drawer_widget.dart';
import 'package:do_an_flutter/Widget/item_category_widget.dart';
import 'package:do_an_flutter/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'home_page.dart';
part 'setting_page.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  List<Widget> widgetPage = [
    const HomePage(),
    const Center(child: Text("Sản phẩm page")),
    const Center(child: Text("Sản phẩm page")),
    const SettingPage(),
  ];

  int currentIndexBottomNav = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        //huy keyboard khi bam ngoai man hinh va` catch drawer
        //https://github.com/flutter/flutter/issues/54277
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        //Hide
        extendBodyBehindAppBar: true,

        drawer: const DrawerWidget(),
        body: widgetPage.elementAt(currentIndexBottomNav), //Footer
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [BoxShadow(blurRadius: 0.1, color: Get.theme.colorScheme.shadow)],
          ),
          child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                currentIndex: currentIndexBottomNav,
                onTap: (index) => setState(() => currentIndexBottomNav = index),
                items: [
                  _bottomNavBar(StringConstant.Home.tr, Icons.home),
                  _bottomNavBar(StringConstant.Myorder.tr, Icons.library_books),
                  _bottomNavBar(StringConstant.Favorite.tr, Icons.favorite),
                  _bottomNavBar(StringConstant.Setting.tr, Icons.settings),
                ],
              )),
        ),
      ),
    ));
  }
}

BottomNavigationBarItem _bottomNavBar(String label, IconData iconData) => BottomNavigationBarItem(
    icon: Icon(iconData),
    label: label,
    activeIcon: Container(
        decoration: BoxDecoration(color: Get.theme.colorScheme.secondary, shape: BoxShape.circle),
        child: Padding(padding: const EdgeInsets.all(5), child: Icon(iconData))));