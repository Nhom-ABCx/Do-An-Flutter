import 'package:flutter/material.dart';
import '../Pages/all_page.dart';

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
  const color = Colors.white;
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

//ko tach duoc thang nay sang buildWidget, cha biet tai sao
Widget buildItem(SanPham _sp) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Container(
      width: 150,
      padding: const EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
                child: AspectRatio(
              aspectRatio: 4 / 3, //cai nay de fix khi anh bi loi~
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  _sp.HinhAnh,
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ),
          Text(
            _sp.TenSanPham,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("10000 VNĐ",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text("20000 VNĐ",
              style: TextStyle(decoration: TextDecoration.lineThrough)),
          const Text("Sale 99%"),
        ],
      ),
    ),
  );
}

Widget buildSesion(
    {required IconData icon, required String title, required String lable}) {
  const color = Colors.green;
  const colorText = Colors.black;
  const padding = EdgeInsets.fromLTRB(0, 10, 0, 10);
  return Padding(
    padding: padding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Text(title,
                  style: const TextStyle(
                      color: colorText,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
        Text(lable,
            style: const TextStyle(
              color: colorText,
            ))
      ],
    ),
  );
}

Widget buildSessionCutoms(
    {required IconData icons,
    required String text,
    required String textCustoms}) {
  const icon = Icons.chevron_right;
  Color clr = Colors.blue;
  Row object_1 = Row(
    children: [
      Icon(icons, color: Colors.brown, size: 27),
      Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 17),
          ))
    ],
  );
  return ColoredBox(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              object_1,
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(textCustoms, style: TextStyle(color: clr)),
                      const Icon(
                        icon,
                        color: Colors.blue,
                      )
                    ],
                  ))
            ],
          )));
}
