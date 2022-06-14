import 'package:do_an_flutter/Config/Language/base_translation.dart';
import 'package:do_an_flutter/Config/Language/translation_service.dart';
import 'package:do_an_flutter/Config/theme.dart';
import 'package:do_an_flutter/Model/hinh_anh.dart';
import 'package:do_an_flutter/Model/loai_san_pham.dart';
import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:do_an_flutter/Module/home/home_controller.dart';

import 'package:do_an_flutter/Module/search/search_page.dart';
import 'package:do_an_flutter/Module/home/widget/home_widget_banner.dart';
import 'package:do_an_flutter/Module/search/view_more_page.dart';
import 'package:do_an_flutter/Ultis/helper.dart';

import 'package:do_an_flutter/Widget/product_card_2.dart';
import 'package:do_an_flutter/Widget/product_card_1.dart';
import 'package:do_an_flutter/Widget/drawer_widget.dart';
import 'package:do_an_flutter/Widget/category_card_1.dart';
import 'package:do_an_flutter/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'home_page.dart';
part 'setting_page.dart';
part 'my_order.dart';
part 'cart.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  List<Widget> widgetPage = [
    const HomePage(),
    const MyOrder(),
    const Center(child: Text("Sản phẩm page")),
    const SettingPage(),
  ];

  int currentIndexBottomNav = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        body: SafeArea(
          child: RefreshIndicator(
              onRefresh: () async {
                //reload all widget
                // ignore: invalid_use_of_protected_member
                (context as Element).reassemble();
              },
              child: widgetPage.elementAt(currentIndexBottomNav)),
        ),
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
                  _bottomNavBar(BaseTranslation.Home.tr, Icons.home),
                  _bottomNavBar(BaseTranslation.Myorder.tr, Icons.library_books),
                  _bottomNavBar(BaseTranslation.Favorite.tr, Icons.favorite),
                  _bottomNavBar(BaseTranslation.Setting.tr, Icons.settings),
                ],
              )),
        ),
      ),
    );
  }
}

BottomNavigationBarItem _bottomNavBar(String label, IconData iconData) => BottomNavigationBarItem(
    icon: Icon(iconData),
    label: label,
    activeIcon: DecoratedBox(
        decoration: BoxDecoration(color: Get.theme.colorScheme.secondary, shape: BoxShape.circle),
        child: Padding(padding: const EdgeInsets.all(5), child: Icon(iconData))));
