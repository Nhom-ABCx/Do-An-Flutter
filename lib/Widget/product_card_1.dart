import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:do_an_flutter/Route/pages.dart';
import 'package:do_an_flutter/Ultis/helper.dart';
import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard1 extends StatelessWidget {
  const ProductCard1(this.sanPham, {Key? key}) : super(key: key);

  final SanPham sanPham;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.68,
      child: GestureDetector(
          onTap: () => Get.toNamed("${Routes.ProductDetail}${sanPham.id}", arguments: sanPham),
          child: Card(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).hoverColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Hero(
                      tag: "${sanPham.id}",
                      child: imageNetwork(sanPham.hinhAnh!.first.hinhAnh!),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: Text(
                    sanPham.tenSanPham!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${Helper.formatNumber(sanPham.cTSanPham!.first.giaBan! - sanPham.cTSanPham!.first.giamGia!)} đ",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: true ? Colors.red.withOpacity(0.1) : Theme.of(context).hoverColor,
                            shape: BoxShape.circle,
                          ),
                          child: RawMaterialButton(
                            shape: const CircleBorder(),
                            onPressed: () {},
                            child: true
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
