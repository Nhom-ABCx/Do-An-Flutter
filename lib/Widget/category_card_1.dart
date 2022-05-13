import 'package:flutter/material.dart';

class CategoryCard1 extends StatelessWidget {
  final int newItemCount;

  const CategoryCard1({Key? key, this.newItemCount = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 100,
          child: InkWell(
            onTap: () {},
            child: Card(
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.event_seat,
                    size: 40,
                  ),
                  Text(
                    "Category",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
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
      ],
    );
  }
}
