import 'package:do_an_flutter/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailWidgetProductImage extends StatefulWidget {
  const DetailWidgetProductImage(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  State<DetailWidgetProductImage> createState() => _DetailWidgetProductImageState();
}

class _DetailWidgetProductImageState extends State<DetailWidgetProductImage> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      SizedBox(
        height: Get.height / 3,
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: widget.product.id.toString(),
            child: Image.asset(
              widget.product.images[selectedImage],
            ),
          ),
        ),
      ),
      // SizedBox(height: getProportionateScreenWidth(20)),
      Wrap(
        alignment: WrapAlignment.center,
        children: List.generate(widget.product.images.length, (index) => buildSmallProductPreview(index)),
      )
    ]));
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () => setState(() => selectedImage = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: Get.width / 7,
        width: Get.width / 7,
        decoration: BoxDecoration(
          color: Get.theme.cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Get.theme.primaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}
