import 'package:do_an_flutter/Config/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:flutter/material.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(ThemeConfig.defaultPaddingAll),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    child: imageNetwork(
                      "https://cdn.tgdd.vn/Products/Images/42/247364/samsung-galaxy-m53-nau-thumb-600x600.jpg",
                      useBaseUrl: false,
                      width: 120,
                      height: 100,
                    ),
                    onTap: () {},
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
                const Text("Giá: 123456", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.blueAccent)),

                const Text(
                  'Còn: 11',
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
            ),
          ),
        ),
        //yeu tich
        Positioned(
            right: -5,
            top: -6,
            child: IconButton(
              onPressed: () async {},
              icon: const Icon(
                Icons.favorite, //border
                color: Colors.red,
              ),
            )),
      ],
    );
  }
}