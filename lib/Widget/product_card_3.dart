import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:do_an_flutter/Route/pages.dart';
import 'package:do_an_flutter/Ultis/helper.dart';
import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard3 extends StatelessWidget {
  const ProductCard3(this.sanPham, {Key? key}) : super(key: key);
  final SanPham sanPham;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("${Routes.ProductDetail}${sanPham.id}", arguments: sanPham),
      child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  width: 130,
                  child: Hero(
                    tag: "${sanPham.id}",
                    child: imageNetwork(sanPham.hinhAnh!.first.hinhAnh!),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(sanPham.tenSanPham!),
                    const SizedBox(height: 20),
                    Text(
                      sanPham.moTa!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${Helper.formatNumber(sanPham.cTSanPham!.first.giaBan! - sanPham.cTSanPham!.first.giamGia!)} đ",
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Text("Số lượng tồn: 12", style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
