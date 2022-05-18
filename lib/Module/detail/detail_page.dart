import 'package:do_an_flutter/Model/product.dart';
import 'package:do_an_flutter/Module/detail/detail_controller.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_color_dots.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_product_description.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_product_image.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_product_title.dart';
import 'package:do_an_flutter/Widget/top_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            DetailWidgetProductImage(product),
            SliverToBoxAdapter(
                child: TopRoundedContainer(
              color: Get.theme.cardColor,
              child: Column(children: [
                //
                DetailWidgetProductTitle(product),
                TopRoundedContainer(
                    color: Theme.of(context).hoverColor,
                    child: Column(
                      children: [
                        //
                        DetailWidgetColorDots(product.colors),
                        Container(
                          width: double.infinity,
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          margin: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                              onPressed: () {},
                              style:
                                  ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                              child: const Text("Add to cart")),
                        ),
                        TopRoundedContainer(color: Get.theme.cardColor, child: DetailWidgetProductDescription(product)),
                      ],
                    )),
              ]),
            )),
          ],
        ),
      ),
    ));
  }
}
