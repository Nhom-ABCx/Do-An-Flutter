import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:flutter/material.dart';

class ProductCard2 extends StatelessWidget {
  final bool useStyle2;
  const ProductCard2({Key? key, this.useStyle2 = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
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
    );
  }

  Widget _style1() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageNetwork("https://cdn.tgdd.vn/Products/Images/42/247364/samsung-galaxy-m53-nau-thumb-600x600.jpg",
                  useBaseUrl: false, height: 100),
            ),
          ),
          //ten san pham
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "widget.sanPham.sanPhamsanPhamsanPhamsanPhamsanPhamsanPhamsanPhamsanPhamsanPham",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Text("123,456 đ",
              style: TextStyle(
                fontSize: 13,
                color: Colors.blue,
                decoration: TextDecoration.lineThrough,
              )),

          const Text(
            'Giá: 123,456 đ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),
          ),
          //rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBarIndicator(
                  rating: 4.5,
                  itemSize: 20.0,
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  }),
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
            child: imageNetwork("https://cdn.tgdd.vn/Products/Images/42/247364/samsung-galaxy-m53-nau-thumb-600x600.jpg",
                useBaseUrl: false, height: 100),
          ),
          const Expanded(
            child: Text(
              "widget.sanPham.sanPhamsanPhamsanPhamsanPhamsanPhamsanPhamsanPhamsanPhamsanPhamaaaaaaaaaaaaaaaa",
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          RatingBarIndicator(
              rating: 4.5,
              itemSize: 20.0,
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              }),
          const SizedBox(
            width: 100,
            child: Divider(color: Colors.black),
          ),
          const Text("30", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
        ],
      );
}
