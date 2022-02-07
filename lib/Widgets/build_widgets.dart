import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //text input
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../all_page.dart';

final formatNumber = NumberFormat("#,##0", "en_US");
final formatStar = NumberFormat("#0.0");

Widget buildIconButton(BuildContext context, IconData iconItem, Color? colorItem, String? textItem, Widget routetingPage) => Padding(
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => routetingPage,
                      )),
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
      child: CachedNetworkImage(
        imageUrl: _urlImage,
        width: 360,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.black12,
        ),
      ),
    );

Widget buildListTitleDrawer({
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

Widget buildTextMyProfile({required IconData icon, required String title, required String lable}) {
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
              child: Text(title, style: const TextStyle(color: colorText, fontSize: 15, fontWeight: FontWeight.bold)),
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
              child: Text(title, style: const TextStyle(color: colorText, fontSize: 15, fontWeight: FontWeight.bold)),
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
          textInputAction: TextInputAction.next,
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

Widget buildListTitleSetting({IconData? icons, required String text, required String textCustoms, required VoidCallback? onClicked}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
    ),
    child: ListTile(
      leading: icons != null
          ? Icon(
              icons,
              color: Colors.brown,
              size: 27,
            )
          : null,
      title: Text(
        text,
        style: const TextStyle(fontSize: 17),
      ),
      trailing: TextButton(
          onPressed: onClicked,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(textCustoms, style: const TextStyle(color: Colors.blue)),
              const Icon(
                Icons.chevron_right,
                color: Colors.blue,
              )
            ],
          )),
    ),
  );
}

List<Widget> hienThiDanhMucDrawer(BuildContext context) {
  return [
    const SizedBox(height: 16),
    buildListTitleDrawer(
      text: 'My Profile',
      icon: Icons.account_circle,
      onClicked: () => Navigator.pushNamed(context, '/MyProfile'),
    ),
    buildListTitleDrawer(text: 'Notifications', icon: Icons.notifications, onClicked: () => Navigator.pushNamed(context, '/Notifications')),
    buildListTitleDrawer(text: 'ChangePass', icon: Icons.lock_outline_rounded, onClicked: () => Navigator.pushNamed(context, '/ChangePW')),
    buildListTitleDrawer(text: 'My orders', icon: Icons.library_books, onClicked: () => Navigator.pushNamed(context, '/QuanLyDonHangPage')),
    buildListTitleDrawer(
      text: 'Settings',
      icon: Icons.settings,
    ),
    buildListTitleDrawer(
      text: 'Sign Out',
      icon: Icons.logout,
      onClicked: () {
        Provider.of<SocialLogin>(context, listen: false).logOut();
        Auth.khachHang.LogOut();
        Navigator.pushNamedAndRemoveUntil(context, "/Sign_In", (route) => false);
      },
    ),
  ];
}

String avtImageLogOut() {
  return (Auth.khachHang.hinhAnh!.isEmpty) ? "http://10.0.2.2:8000/storage/assets/images/avatar/empty.png" : Auth.khachHang.hinhAnh!;
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
    ..showSnackBar(SnackBar(
        content: Text(
      text,
      textAlign: TextAlign.center,
    )));
}

Widget avtCachedNetworkImage(double _width, double _height) => CachedNetworkImage(
      imageUrl: avtImageLogOut(),
      width: _width,
      height: _height,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
        size: 50,
      ),
    );

Widget orDivider(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
    width: size.width * 0.8,
    child: Row(
      children: <Widget>[
        buildDivider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "OR",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        buildDivider(),
      ],
    ),
  );
}

Expanded buildDivider() {
  //expanded la widget nhu khoang? cach'
  return const Expanded(
    //Divider la ke~ lan`
    child: Divider(
      color: Colors.white,
      height: 1.5,
    ),
  );
}

Widget topMyprofile() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.orange[700],
        border: Border.all(
          color: Colors.red.shade100,
        ),
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    child: Row(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
        child: ClipRRect(borderRadius: BorderRadius.circular(100), child: avtCachedNetworkImage(100, 100)),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '@' + Auth.khachHang.username,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              Auth.khachHang.hoTen!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      )
    ]),
  );
}

void showCustomLoadding() {
  //https://pub.dev/packages/flutter_easyloading
  //cai nay la tuy chinh? loadding
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..radius = 50
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.indigo
    ..textColor = Colors.indigo
    ..fontSize = 20;

  //hien thi loadding
  EasyLoading.show(
    status: "Please wait...",
    maskType: EasyLoadingMaskType.black,
  );
}

Widget titlePageCategory(String text) => Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigoAccent),
          )),
    );

Widget buildListSanPham(BuildContext context, Future<List<SanPham>> listSanPham) => FutureBuilder<List<SanPham>>(
    future: listSanPham,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      }
      return snapshot.hasData
          ? GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => buildItem(snapshot.data![index]))
          : const Center(
              child: CircularProgressIndicator(),
            );
    });

Widget buildItemGioHang({required BuildContext context, String? hinhAnh, required String tenSanPham, String? moTa, double? giaBan, int? soLuong}) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ), // Set rounded corner radius
    width: MediaQuery.of(context).size.width,
    //height: 125,
    //constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.width / (3)),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 130,
          child: CachedNetworkImage(
            imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/" + hinhAnh!,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.black12,
            ),
          ),
        ),
        //bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(text: TextSpan(style: const TextStyle(color: Colors.black), text: tenSanPham)),
              const SizedBox(height: 20),
              Text(
                moTa ?? "",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(formatNumber.format(giaBan) + " VNĐ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text("Quantily: $soLuong", style: const TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ))
      ],
    ),
  );
}

Widget khongCoGiHet(BuildContext context, String svgPicAsset) => Center(
      child: Column(
        children: [
          SvgPicture.asset(
            svgPicAsset,
            width: 200,
            height: 200,
          ),
          const Text(
            "There are no orders place yet.",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, "/Home", (route) => false),
            child: Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                width: 200,
                height: 50.0,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(colors: [
                      Colors.red,
                      Colors.orange,
                    ]),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.pink,
                        blurRadius: 16.0,
                      ),
                    ]),
                child: const Text("Continute Shopping", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
          ),
        ],
      ),
    );
