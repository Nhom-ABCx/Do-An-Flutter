import 'package:do_an_flutter/Module/home/page/container_page.dart';
import 'package:do_an_flutter/Module/home/home_binding.dart';
import 'package:do_an_flutter/Module/wellcome/intro_page.dart';
import 'package:do_an_flutter/Module/wellcome/wellcome_page.dart';
import 'package:get/get.dart';

part 'routes.dart';

class Pages {
  static const initPage = Routes.Wellcome;

  static final getPages = [
    GetPage(name: Routes.Wellcome, page: () => const WellcomePage()),
    GetPage(name: Routes.Intro, page: () => IntroPage()),
    //
    GetPage(
      name: Routes.Home,
      page: () => const ContainerPage(),
      binding: HomeBinding(),
    ),
  ];
}
