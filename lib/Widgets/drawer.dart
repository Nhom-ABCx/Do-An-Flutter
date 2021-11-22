import 'package:flutter/material.dart';
import '../Pages/all_page.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 5);

  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        'images/avt.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "I'm number ONEEEEEEE",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(height: 16),
            buildItemListTitle(
              text: 'My Profile',
              icon: Icons.account_circle,
              onClicked: () => Navigator.pushNamed(context, '/MyProfile'),
            ),
            const SizedBox(height: 16),
            buildItemListTitle(
                text: 'Notifications',
                icon: Icons.notifications,
                onClicked: () =>
                    Navigator.pushNamed(context, '/Notifications')),
            const SizedBox(height: 16),
            buildItemListTitle(
                text: 'ChangePass',
                icon: Icons.change_circle,
                onClicked: () => Navigator.pushNamed(context, '/ChangePW')),
            const SizedBox(height: 16),
            buildItemListTitle(text: 'Settings', icon: Icons.settings),
            const SizedBox(height: 16),
            buildItemListTitle(text: 'Sign Out', icon: Icons.logout),
          ],
        ),
      ),
    );
  }
}
