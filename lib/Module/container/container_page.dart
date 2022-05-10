import 'package:do_an_flutter/Config/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'container_controller.dart';

class ContainerPage extends GetView<ContainerController> {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Obx(() => Scaffold(
            //Hide
            //drawer: const NavigationDrawer(),
            body: controller.widgetPage.elementAt(controller.currentIndexBottomNav.value), //Footer
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
                    currentIndex: controller.currentIndexBottomNav.value,
                    onTap: (index) => controller.currentIndexBottomNav.value = index,
                    items: [
                      _bottomNavBar(StringConstant.Home.tr, Icons.home),
                      _bottomNavBar(StringConstant.Myorder.tr, Icons.menu),
                      _bottomNavBar(StringConstant.Favorite.tr, Icons.favorite),
                      _bottomNavBar(StringConstant.Setting.tr, Icons.settings),
                    ],
                  )),
            ),
          )),
    ));
  }
}

BottomNavigationBarItem _bottomNavBar(String label, IconData iconData) => BottomNavigationBarItem(
    icon: Icon(iconData),
    label: label,
    activeIcon: Container(
        decoration: BoxDecoration(color: Get.theme.colorScheme.secondary, shape: BoxShape.circle),
        child: Padding(padding: const EdgeInsets.all(5), child: Icon(iconData))));
