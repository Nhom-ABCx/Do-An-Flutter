import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_an_flutter/app_binding.dart';
import 'package:flutter/material.dart';
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

Widget imageNetwork(String imageUrl, {double? width, double? height}) => CachedNetworkImage(
      imageUrl: Service.defaultBaseUrl + imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.black12,
      ),
    );
