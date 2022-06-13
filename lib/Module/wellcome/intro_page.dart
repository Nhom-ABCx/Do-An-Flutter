import 'package:do_an_flutter/Config/Language/base_translation.dart';
import 'package:do_an_flutter/Route/pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() => Get.offAllNamed(Routes.Login);

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      // globalHeader: Align(
      //   alignment: Alignment.topRight,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 16, right: 16),
      //       child: _buildImage('flutter.png', 100),
      //     ),
      //   ),
      // ),

      pages: [
        PageViewModel(
          title: BaseTranslation.introTitle1.tr,
          body: BaseTranslation.introBody1.tr,
          image: Image.asset("assets/images/intro_app/1.webp"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: BaseTranslation.introTitle2.tr,
          body: BaseTranslation.introBody2.tr,
          image: Image.asset("assets/images/intro_app/3.webp"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: BaseTranslation.introTitle3.tr,
          body: BaseTranslation.introBody3.tr,
          image: Image.asset("assets/images/intro_app/2.jpg"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: BaseTranslation.introTitle4.tr,
          body: BaseTranslation.introBody4.tr,
          image: Image.asset(
            "assets/images/intro_app/fullscreen.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: BaseTranslation.lastTitleIntro.tr,
          body: BaseTranslation.lastBodyIntro.tr,
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: Image.asset("assets/images/intro_app/4.webp"),
          reverse: true,
        ),
      ],
      onDone: _onIntroEnd,
      onSkip: _onIntroEnd, // You can override onSkip callback
      showSkipButton: true, //skip and back 1 true 1 false
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false, //skip and back 1 true 1 false
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: Text(BaseTranslation.Skip.tr, style: const TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: Text(BaseTranslation.Done.tr, style: const TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      // dotsContainerDecorator: const ShapeDecoration(
      //   color: Colors.black87,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
      //   ),
      // ),
    );
  }
}
