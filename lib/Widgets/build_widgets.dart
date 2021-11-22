import 'package:flutter/material.dart';
//import '../Pages/all_page.dart';

Widget buildIconButton(IconData iconItem, Color? colorItem, String? textItem) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 100,
          height: 80,
          color: Colors.white,
          child: Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    iconItem,
                    size: 30.0,
                    color: colorItem,
                  )),
              Text(
                textItem!,
              ),
            ],
          ),
        ),
      ),
    );

Widget buildImage(String _urlImage, int index) => Container(
      //margin: const EdgeInsets.symmetric(horizontal: 24),
      color: Colors.grey,
      child: Image.asset(
        _urlImage,
        width: 360,
        fit: BoxFit.cover,
      ),
    );

Widget buildItemListTitle({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = Colors.black;
  const hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      text,
      style: const TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
    // trailing: Container(
    //   decoration: const BoxDecoration(
    //     color: Colors.orange,
    //     shape: BoxShape.rectangle,
    //     borderRadius: BorderRadius.all(Radius.circular(8)),
    //   ),
    //   width: 25,
    //   child: Text(
    //     "3",
    //     style: const TextStyle(fontSize: 20, color: Colors.black),
    //     textAlign: TextAlign.center,
    //   ),
    // ),
  );
}
