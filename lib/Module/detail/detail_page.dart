import 'package:do_an_flutter/Config/theme.dart';
import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:do_an_flutter/Module/detail/detail_controller.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_color_dots.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_product_comment.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_product_description.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_product_image.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_product_title.dart';
import 'package:do_an_flutter/Widget/top_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage(this.sanPham, {Key? key}) : super(key: key);
  final SanPham sanPham;

  @override
  Widget build(BuildContext context) => SafeArea(
          child: GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //Hide
          //drawer: const NavigationDrawer(),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart, color: Colors.amber)),
                ],
              ),
              DetailWidgetProductImage(sanPham),
              SliverToBoxAdapter(
                  child: TopRoundedContainer(
                color: Get.theme.cardColor,
                child: Column(children: [
                  //
                  DetailWidgetProductTitle(sanPham),
                  TopRoundedContainer(
                      color: Theme.of(context).hoverColor,
                      child: Column(
                        children: [
                          //
                          const DetailWidgetColorDots([Colors.red, Colors.green, Colors.blue]),
                          TopRoundedContainer(
                              color: Get.theme.cardColor,
                              child: Column(children: [
                                //
                                DetailWidgetProductDescription(sanPham),
                                TopRoundedContainer(color: Theme.of(context).hoverColor, child: const DetailWidgetProductComment()),
                              ])),
                        ],
                      )),
                ]),
              )),
            ],
          ),
        ),
      ));
}
