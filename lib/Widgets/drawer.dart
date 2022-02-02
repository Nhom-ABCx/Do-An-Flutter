import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                    ClipRRect(borderRadius: BorderRadius.circular(100), child: avtCachedNetworkImage(100, 100)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        _chuaDangNhap ? "You are not login" : ((Auth.khachHang.hoTen!.isEmpty) ? Auth.khachHang.username : Auth.khachHang.hoTen!),
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
              buildListTitleDrawer(
                text: 'Loggin Now',
                icon: Icons.login_outlined,
                onClicked: () async {
                  Provider.of<SocialLogin>(context, listen: false).logOut();
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
