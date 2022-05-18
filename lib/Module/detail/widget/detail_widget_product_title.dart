import 'package:do_an_flutter/Config/theme.dart';
import 'package:do_an_flutter/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailWidgetProductTitle extends StatefulWidget {
  const DetailWidgetProductTitle(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  State<DetailWidgetProductTitle> createState() => _DetailWidgetProductTitleState();
}

class _DetailWidgetProductTitleState extends State<DetailWidgetProductTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: (ThemeConfig.defaultPaddingAll)),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        //rating
        Row(
          children: [
            const SizedBox(width: ThemeConfig.defaultPaddingAll / 1.3),
            RatingBarIndicator(
                rating: 4.5,
                itemSize: 25.0,
                itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    )),
            //khoang cach' can le` cho le :v
            const Expanded(child: Text("   4.5")),
            Container(
              padding: const EdgeInsets.all((15)),
              //width: 64,
              decoration: BoxDecoration(
                color: widget.product.isFavourite ? Colors.red.withOpacity(0.1) : Theme.of(context).hoverColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
              ),
              child:
                  widget.product.isFavourite ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_outline, color: Colors.red),
            )
          ],
        ),
        const Center(
            child: Text(
          '123,456,789 đ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
        )),
      ],
    );
  }
}
