import 'package:do_an_flutter/View/container/container_binding.dart';
import 'package:do_an_flutter/View/container/container_page.dart';
import 'package:get/get.dart';

part 'routes.dart';

class Pages {
  static const initPage = Routes.CONTAINER;

  static final getPages = [
    GetPage(
      name: Routes.CONTAINER,
      page: () => const ContainerPage(),
      bindings: [
        ContainerBinding(),
        //HomeBinding(),
        //SettingBinding(),
      ],
    ),
  ];
}
