import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:do_an_flutter/Route/pages.dart';
import 'package:do_an_flutter/Ultis/helper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard2 extends StatelessWidget {
  final bool useStyle2;
  final SanPham sanPham;
  const ProductCard2(this.sanPham, {Key? key, this.useStyle2 = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: () => Get.toNamed("${Routes.ProductDetail}${sanPham.id}", arguments: sanPham),
        child: Stack(
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: useStyle2 ? _style2() : _style1(),
              ),
            ),
            //yeu tich
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Icons.favorite, //border
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _style1() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: "${sanPham.id}",
                child: imageNetwork(sanPham.hinhAnh!.first.hinhAnh!, height: 100),
              ),
            ),
          ),
          //ten san pham
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                sanPham.tenSanPham!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text("${Helper.formatNumber(sanPham.cTSanPham!.first.giaBan! - sanPham.cTSanPham!.first.giamGia!)} đ",
              style: const TextStyle(
                fontSize: 13,
                color: Colors.blue,
                decoration: TextDecoration.lineThrough,
              )),

          Text(
            "${Helper.formatNumber(sanPham.cTSanPham!.first.giaBan! - sanPham.cTSanPham!.first.giamGia!)} đ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),
          ),
          //rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBarIndicator(
                  rating: sanPham.star!,
                  itemSize: 20.0,
                  itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      )),
              //add cart
              InkWell(
                child: const Icon(Icons.add_circle, color: Colors.green, size: 30),
                onTap: () {},
              ),
            ],
          ),
        ],
      );
  Widget _style2() => Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: "${sanPham.id}",
              child: imageNetwork(sanPham.hinhAnh!.first.hinhAnh!, height: 100),
            ),
          ),
          Expanded(
            child: Text(
              sanPham.tenSanPham!,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          RatingBarIndicator(
              rating: sanPham.star!,
              itemSize: 20.0,
              itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  )),
          const SizedBox(
            width: 100,
            child: Divider(color: Colors.black),
          ),
          const Text("30", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
        ],
      );
}
