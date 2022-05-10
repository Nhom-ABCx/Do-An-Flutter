import 'package:do_an_flutter/Module/container/container_binding.dart';
import 'package:do_an_flutter/Module/container/container_page.dart';
import 'package:do_an_flutter/Module/furniture-clone/furniture-home.dart';
import 'package:do_an_flutter/Module/home/home_binding.dart';
import 'package:do_an_flutter/Module/login/welcome_page.dart';
import 'package:get/get.dart';

part 'routes.dart';

class Pages {
  static const initPage = Routes.Wellcome;

  static final getPages = [
    GetPage(
      name: Routes.Wellcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.Container,
      page: () => const ContainerPage(),
      bindings: [
        ContainerBinding(),
        HomeBinding(),
        //SettingBinding(),
      ],
    ),
    GetPage(
      name: Routes.Home,
      page: () => const FurnitureHome(),
    ),
  ];
}
