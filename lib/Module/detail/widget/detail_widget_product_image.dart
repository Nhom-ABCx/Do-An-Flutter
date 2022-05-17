import 'package:carousel_slider/carousel_slider.dart';
import 'package:do_an_flutter/Model/product.dart';
import 'package:flutter/material.dart';

class DetailWidgetProductImage extends StatefulWidget {
  const DetailWidgetProductImage(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  State<DetailWidgetProductImage> createState() => _DetailWidgetProductImageState();
}

class _DetailWidgetProductImageState extends State<DetailWidgetProductImage> {
  int selectedImage = 0;
  final CarouselController _controller = CarouselController();
  
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: widget.product.id.toString(),
            child: Image.asset(widget.product.images[selectedImage]),
          ),
        ),
      ),
      // SizedBox(height: getProportionateScreenWidth(20)),
      Wrap(
        alignment: WrapAlignment.center,
        children: List.generate(
            widget.product.images.length,
            (index) => GestureDetector(
                  onTap: () => setState(() => selectedImage = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.width / 7,
                    width: MediaQuery.of(context).size.width / 7,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).primaryColor.withOpacity(selectedImage == index ? 1 : 0)),
                    ),
                    child: Image.asset(widget.product.images[index]),
                  ),
                )),
      )
    ]));
  }
}
