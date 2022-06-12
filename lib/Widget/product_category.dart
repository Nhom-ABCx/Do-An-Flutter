import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Model/san_pham.dart';

class PrdCategory extends StatelessWidget {
  const PrdCategory({Key? key, required this.sanPham}) : super(key: key);
  final SanPham sanPham;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              imageNetwork("${sanPham.hinhAnh!.first.hinhAnh}", width: 130),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${sanPham.tenSanPham}"),
                  const SizedBox(height: 20),
                  // const Text(
                  //   "mô tả gì gì đó đó",
                  //   style: TextStyle(color: Colors.grey),
                  // ),
                  RatingBarIndicator(
                      rating: sanPham.star!,
                      itemSize: 20.0,
                      itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          )),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${sanPham.cTSanPham![0].giaBan}", style: TextStyle(fontWeight: FontWeight.bold)),
                      // Text("Số lượng tồn: 12", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
