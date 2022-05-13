import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:flutter/material.dart';

class ProductCard3 extends StatelessWidget {
  const ProductCard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              imageNetwork("https://cdn.tgdd.vn/Products/Images/42/247364/samsung-galaxy-m53-nau-thumb-600x600.jpg", useBaseUrl: false, width: 130),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("ten san phamten san phamten san phamten san phamten san pham"),
                  const SizedBox(height: 20),
                  const Text(
                    "mô tả gì gì đó đó",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("100,000 VNĐ", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Số lượng tồn: 12", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
