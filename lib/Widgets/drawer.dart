import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 5);

  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        // color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
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
                        ' In the VietNam',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
            const SizedBox(height: 16),
            buildItem(
              text: 'My Profile',
              icon: Icons.account_circle,
              onClicked: () =>
                  Navigator.pushReplacementNamed(context, '/MyProfile'),
            ),
            const SizedBox(height: 16),
            //  buildItem(
            //    text: 'Notifications',
            //    icon: Icons.notifications),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              trailing: Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                width: 25,
                child: const Text(
                  "3",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
                  
                  leading: Icon(Icons.change_circle),
                  title: const Text('ChangePass'),
                  onTap: (){
                    Navigator.pushNamed(context, '/ChangePW');
                  },
                ),
            const SizedBox(height: 16),
            buildItem(text: 'Settings', icon: Icons.settings),
            const SizedBox(height: 16),
            buildItem(text: 'Sign Out', icon: Icons.logout),
          ],
        ),
      ),
    );
  }
}

Widget buildItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = Colors.white;
  final hoverColor = Colors.white70;
  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      text,
      style: const TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}
