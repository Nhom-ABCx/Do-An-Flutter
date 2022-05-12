import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 5);

  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          //cai thang nay la config lai giao dien cua toan bo
          //canvasColor: const Color(0xFF0d3bd1),
          ),
      child: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 210,
              child: DrawerHeader(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/3.jpg"),
                  ),
                  Text(
                    "Auth.khachHang.usernameAuth.khachHang.usernameAuth.khachHang.usernameAuth.khachHang.usernameAuth.khachHang.usernamekhachHang.usernam",
                    overflow: TextOverflow.fade,
                    maxLines: 4,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              )),
            ),
            ...[
              _buildListTitleDrawer(text: 'My Profile', icon: Icons.account_circle, onTap: () {}),
              _buildListTitleDrawer(text: 'Notifications', icon: Icons.notifications, onTap: () {}),
              _buildListTitleDrawer(text: 'ChangePass', icon: Icons.lock, onTap: () {}),
              _buildListTitleDrawer(text: 'Sign Out', icon: Icons.logout, onTap: () {}),
            ],
          ],
        ),
      ),
    );
  }
}

Widget _buildListTitleDrawer({
  required String text,
  required IconData icon,
  VoidCallback? onTap,
}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(text),
    onTap: onTap,
  );
}
