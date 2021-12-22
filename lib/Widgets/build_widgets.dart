import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //text input
import '../all_page.dart';

// class PhoneScreen extends StatefulWidget {
//   const PhoneScreen({Key? key}) : super(key: key);

//   @override
//   _PhonePageState createState() => _PhonePageState();
// }

// class _PhonePageState extends State<PhoneScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(padding: const EdgeInsets.all(10.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Container(
//           width: 100,
//           height: 80,
//           color: Colors.white,
//           child: Column(
//             children: [
//               IconButton(
//                   onPressed: () {
//                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const PhonePage()));
//                   },
//                   icon: const Icon(
//                    Icons.phone_android_rounded,
//                     size: 30.0,
//                     color:  Colors.red,
//                   )),
//               const Text("Phone"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
Widget buildIconButton(BuildContext context, IconData iconItem,
        Color? colorItem, String? textItem, String routeting) =>
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
                  onPressed: () {
                    Navigator.pushNamed(context, routeting);
                  },
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

Widget buildImageBanner(String _urlImage, int index) => Container(
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

Widget buildItem(BuildContext context, SanPham _sp) {
  return Container(
    width: 200,
    height: 580,
    //color: Colors.indigo,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white,
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: Image.asset(
                "images/product-image/" + _sp.hinhAnh!,
                width: 100,
                height: 130,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetail(sanPham: _sp)));
              },
            ),
          ),
        ),
        Positioned(
            top: 125.0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
              child: Text(
                _sp.tenSanPham,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )),
        Positioned(
          top: 150.0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
            child: Text(
              'Giá:' + _sp.giaBan.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.blueAccent),
            ),
          ),
        ),
        Positioned(
            top: 170.0,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
                child: Text(
                  'Còn:' + _sp.soLuongTon.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.red),
                ))),
        Positioned(
          left: 140.0,
          top: 146.0,
          child: Align(
              alignment: const Alignment(3, 0),
              child: IconButton(
                onPressed: () async {
                  await SanPhamController.AddCart(
                      Auth.khachHang.id!, _sp.id!, 1);
                  print(SanPhamController.Cart[1]);              
                },
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.green,
                  size: 40.0,
                ),
              )),
        )
      ],
    ),
  );
}

Widget buildTextMyProfile(
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

Widget buildInputTextMyProfile(AsyncSnapshot<Object?> snapshot,
    {required IconData icon,
    required String title,
    required TextEditingController txtController,
    TextInputType? txtInputType = TextInputType.text,
    bool? inputNumberOnly = false}) {
  const color = Colors.green;
  const colorText = Colors.black;
  const padding = EdgeInsets.fromLTRB(0, 10, 0, 10);
  return Padding(
    padding: padding,
    child: Column(
      children: [
        Row(
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
        TextField(
          decoration: InputDecoration(
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          controller: txtController, //gan gia tri cua text vao bien'
          keyboardType: txtInputType,
          textInputAction: TextInputAction.done,
          inputFormatters: inputNumberOnly!
              ? <TextInputFormatter>[
                  //only number
                  FilteringTextInputFormatter.digitsOnly
                ]
              : null,
        )
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
// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Main Screen'),
//       ),
//       body: GestureDetector(
//         child: Hero(
//             tag: 'imageHero',
//             child: CachedNetworkImage(
//               imageUrl:
//                   'https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg',
//               placeholder: new CircularProgressIndicator(),
//               errorWidget: new Icon(Icons.error),
//             )),
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (_) {
//             return DetailScreen();
//           }));
//         },
//       ),
//     );
//   }
// }

List<Widget> hienThiDanhMucDrawer(BuildContext context) {
  return [
    const SizedBox(height: 16),
    buildItemListTitle(
      text: 'My Profile',
      icon: Icons.account_circle,
      onClicked: () => Navigator.pushNamed(context, '/MyProfile'),
    ),
    //const SizedBox(height: 16),
    buildItemListTitle(
        text: 'Notifications',
        icon: Icons.notifications,
        onClicked: () => Navigator.pushNamed(context, '/Notifications')),
    //const SizedBox(height: 16),
    buildItemListTitle(
        text: 'ChangePass',
        icon: Icons.change_circle,
        onClicked: () => Navigator.pushNamed(context, '/ChangePW')),
    //const SizedBox(height: 16),
    buildItemListTitle(text: 'Settings', icon: Icons.settings),
    //const SizedBox(height: 16),
    buildItemListTitle(
      text: 'Sign Out',
      icon: Icons.logout,
      onClicked: () {
        Auth.khachHang.LogOut();
        Navigator.pushNamedAndRemoveUntil(context, "/Home", (route) => false);
      },
    ),
  ];
}

String avtImageFix() {
  return (Auth.khachHang.hinhAnh!.isEmpty)
      ? "images/gallery/user2.png"
      : "images/gallery/" + Auth.khachHang.hinhAnh!;
}

Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );

void thongBaoScaffoldMessenger(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
}
