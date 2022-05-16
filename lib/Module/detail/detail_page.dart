import 'package:do_an_flutter/Model/product.dart';
import 'package:do_an_flutter/Module/detail/detail_controller.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_product_image.dart';
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.onSurface.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Text("${product.rating}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Get.theme.colorScheme.onSurface,
                          )),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            DetailWidgetProductImage(product),
          ],
        ),
      ),
    ));
  }
}
