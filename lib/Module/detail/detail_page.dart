import 'package:carousel_slider/carousel_slider.dart';
import 'package:do_an_flutter/Config/theme.dart';
import 'package:do_an_flutter/Module/detail/detail_controller.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_playvideo.dart';
import 'package:do_an_flutter/Module/detail/widget/detail_widget_product_comment.dart';
import 'package:do_an_flutter/Ultis/helper.dart';
import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:do_an_flutter/Widget/top_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

part 'widget/detail_widget_product_image.dart';
part 'widget/detail_widget_product_title.dart';
part 'widget/detail_widget_color_dots.dart';
part 'widget/detail_widget_product_description.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //Hide
        //drawer: const NavigationDrawer(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart, color: Colors.amber)),
                ],
              ),
              const DetailWidgetProductImage(),
              SliverToBoxAdapter(
                  child: TopRoundedContainer(
                color: Get.theme.cardColor,
                child: Column(children: [
                  //
                  const DetailWidgetProductTitle(),
                  TopRoundedContainer(
                      color: Theme.of(context).hoverColor,
                      child: Column(
                        children: [
                          //
                          const DetailWidgetColorDots(),
                          TopRoundedContainer(
                              color: Get.theme.cardColor,
                              child: Column(children: [
                                //
                                const DetailWidgetProductDescription(),
                                //video
                                const PlayVideoWidget("https://www.youtube.com/watch?v=ZPEDIqYJyM4"),
                                TopRoundedContainer(color: Theme.of(context).hoverColor, child: const DetailWidgetProductComment()),
                              ])),
                        ],
                      )),
                ]),
              )),
              const SliverToBoxAdapter(child: SizedBox(height: 50)),
            ],
          ),
        ),
        bottomSheet: BottomSheet(
            onClosing: () {},
            builder: (context) => Container(
                  color: Theme.of(context).secondaryHeaderColor,
                  // width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //side: const BorderSide(color: Colors.pink)
                        )),
                        backgroundColor: MaterialStateProperty.all(Colors.amber.shade200),
                      ),
                      icon: const Icon(Icons.shopping_cart),
                      label: Text(
                        "Mua ngay !",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  )),
                )),
      ),
    );
  }
}
