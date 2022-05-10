import 'package:do_an_flutter/Config/language/translation_service.dart';
import 'package:do_an_flutter/Config/theme.dart';
import 'package:do_an_flutter/Route/pages.dart';
import 'package:do_an_flutter/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  //chinh cai' mau` cua nen` pin
  //SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.green));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Shop',
        debugShowCheckedModeBanner: false, //tat cai' debug tren appbar
        enableLog: true,
        initialRoute: Pages.initPage,
        defaultTransition: Transition.fade,
        getPages: Pages.getPages,
        initialBinding: AppBinding(),
        smartManagement: SmartManagement.keepFactory,
        //theme
        theme: ThemeConfig.lightTheme,
        darkTheme: ThemeConfig.dartTheme,
        themeMode: ThemeMode.system,
        //ngon ngu~
        locale: TranslationService.locale.value,
        translations: TranslationService(),
        fallbackLocale: TranslationService.fallbackLocale,
      );
}
