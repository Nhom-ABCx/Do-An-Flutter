import 'package:do_an_flutter/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailWidgetProductDescription extends StatefulWidget {
  const DetailWidgetProductDescription(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  State<DetailWidgetProductDescription> createState() => _DetailWidgetProductDescriptionState();
}

class _DetailWidgetProductDescriptionState extends State<DetailWidgetProductDescription> {
  int? maxline = 3;
  TextOverflow? overflow = TextOverflow.ellipsis;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: (20)),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        //rating
        Row(
          children: [
            const SizedBox(width: 15),
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
                color: widget.product.isFavourite ? Colors.red.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
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
        const Divider(),
        //description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: (20)),
          child: Text(
            widget.product.description,
            maxLines: maxline,
            overflow: overflow, //...
          ),
        ),
        //see more detail
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: (20), vertical: 10),
          child: GestureDetector(
            onTap: () => setState(() {
              if (maxline == null && overflow == null) {
                maxline = 3;
                overflow = TextOverflow.ellipsis;
              } else {
                maxline = overflow = null;
              }
            }),
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
