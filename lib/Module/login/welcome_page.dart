import 'package:do_an_flutter/Route/pages.dart';
import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() async {
    //
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.toNamed(Routes.Container);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageNetwork("/storage/assets/images/logo/logo-web1.png", width: 200),
            const Text('Shop', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'Your shopping solution',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
