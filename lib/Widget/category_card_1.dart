import 'package:do_an_flutter/Model/loai_san_pham.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Module/detail/detail_category/detail_caterogy_page.dart';

class CategoryCard1 extends StatelessWidget {
  final int? newItemCount;
  final LoaiSanPham loaiSanPham;

  const CategoryCard1(this.loaiSanPham, {Key? key, this.newItemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 100,
          child: InkWell(
            onTap: () => Get.to(
              DetailCaterogy(
                typeProduct: loaiSanPham,
              ),
            ),
            child: Card(
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.category_outlined,
                    size: 40,
                  ),
                  Text(
                    loaiSanPham.tenLoai!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
        newItemCount != null
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    //border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "$newItemCount",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}
