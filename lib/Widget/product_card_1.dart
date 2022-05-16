import 'package:do_an_flutter/Model/product.dart';
import 'package:do_an_flutter/Module/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard1 extends StatelessWidget {
  const ProductCard1({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.68,
      child: GestureDetector(
          onTap: () => Get.to(DetailPage(product)),
          child: Card(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Hero(
                        tag: product.id.toString(),
                        child: Image.asset(product.images[0]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF7643),
                        ),
                      ),
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: product.isFavourite ? const Color(0xFFFF7643).withOpacity(0.15) : const Color(0xFF979797).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: RawMaterialButton(
                            shape: const CircleBorder(),
                            onPressed: () {},
                            child: product.isFavourite
                                ? const Icon(
                                    Icons.favorite, //border
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_outline, //border
                                    color: Colors.red,
                                  ),
                          )),
                    ],
                  )
                ],
              ))),
    );
  }
}
