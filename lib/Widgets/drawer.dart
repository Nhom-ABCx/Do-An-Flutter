import 'package:flutter/material.dart';
import '../all_page.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 5);

  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _chuaDangNhap = (Auth.khachHang.id! < 0);

    return Theme(
      data: Theme.of(context).copyWith(
        //cai thang nay la config lai giao dien cua toan bo
        canvasColor: const Color(0xFF0d3bd1),
      ),
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                    //color: Colors.indigo,
                    ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          avtImageFix(),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        _chuaDangNhap
                            ? "You are not login"
                            : ((Auth.khachHang.username.isEmpty)
                                ? Auth.khachHang.hoTen!
                                : Auth.khachHang.username),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
            if (_chuaDangNhap)
              buildItemListTitle(
                text: 'Loggin Now',
                icon: Icons.login_outlined,
                onClicked: () {
                  Auth.khachHang.LogOut();
                  Navigator.pushNamedAndRemoveUntil(context, "/Sign_In", (route) => false);
                },
              )
            else
              ...hienThiDanhMucDrawer(context),
          ],
        ),
      ),
    );
  }
}
