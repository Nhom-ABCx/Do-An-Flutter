import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widget/build_widgets.dart';

class LayOutPage2 extends StatefulWidget {
  const LayOutPage2({Key? key}) : super(key: key);
  @override
  State<LayOutPage2> createState() => _LayOutPage2State();
}

class _LayOutPage2State extends State<LayOutPage2> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Center(child: Text("Tiêu đề")),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
            Container(
              width: Get.width,
              decoration: customContainerDeco(),
              child: const Text("aa"),
            ),
          ])),
        ),
      ],
    );
  }
}
