import 'package:do_an_flutter/Config/Language/base_translation.dart';
import 'package:do_an_flutter/Route/pages.dart';
import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({Key? key}) : super(key: key);

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wellComePageInit();
  }

  void wellComePageInit() async {
    //
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.toNamed(Routes.Intro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageNetwork("/storage/assets/images/logo/logo-web1.png", width: 200),
              Text(BaseTranslation.titleWellcome.tr, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  BaseTranslation.subTitleWellcome.tr,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
