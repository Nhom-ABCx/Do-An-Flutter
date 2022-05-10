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
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, //ko cho no thu nho? mat chu~
              currentIndex: controller.currentIndexBottomNav.value,
              //selectedItemColor: Colors.indigo,
              onTap: (index) => controller.currentIndexBottomNav.value = index,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Tổng quan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt),
                  label: 'Đơn hàng',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.inventory),
                  label: 'Sản phẩm',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Cài đặt',
                ),
              ],
            ),
          )),
    ));
  }
}
