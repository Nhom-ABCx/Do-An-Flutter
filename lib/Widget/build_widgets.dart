import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an_flutter/Config/theme.dart';
import 'package:do_an_flutter/Route/pages.dart';
import 'package:do_an_flutter/Widget/elevated_button.dart';
import 'package:do_an_flutter/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//noi viet may cai ham` tong?
Widget itemMenuWidget({required BuildContext context, required Widget child}) => Container(
      margin: const EdgeInsets.only(top: 10),
      width: Get.width / 2.2,
      decoration: customContainerDeco(),
      child: child,
    );

Decoration customContainerDeco() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey, offset: Offset(1, 2))]);

Widget imageNetwork(String imageUrl, {bool useBaseUrl = true, double? width, double? height, BoxFit? fit}) => CachedNetworkImage(
      imageUrl: useBaseUrl ? Service.defaultBaseUrl + imageUrl : imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.black12,
      ),
    );

Widget khongCoGiHet() => Center(
      child: Column(
        children: [
          SvgPicture.asset("assets/svgIcons/empty-box.svg", width: 200, height: 200),
          const SizedBox(height: 25),
          const Text("Empty !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 25),
          //Get.offNamedUntil(Routes.Home, (route) => false)
          ElevatedButtonCustom(
            width: 200,
            onPressed: () {},
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(colors: [
              Colors.red,
              Colors.orange,
            ]),
            child: Text('Continute Shopping', style: ThemeConfig.dartTheme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
