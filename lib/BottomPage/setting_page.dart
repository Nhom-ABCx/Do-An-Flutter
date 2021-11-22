import 'dart:ui';

import 'package:flutter/material.dart';
import '../Pages/all_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  bool isCheck1 = true;
  bool isCheck2 = true;
  bool isCheck3 = true;
  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(),
          //Hide
          drawer: const NavigationDrawer(),
          //Body
          body: Column(
            children: [
              const SizedBox(height: 16.0),
              SwitchListTile(
                title: const Text('Availability'),
                tileColor: Colors.white,
                value: isCheck1,
                onChanged: (bool value) {
                  setState(() {
                    isCheck1 = value;
                  });
                },
                activeColor: Colors.blue[700],
                // inactiveThumbColor: Colors.blue[700],
                inactiveTrackColor: Colors.white,
                secondary: const Icon(
                  Icons.check_box,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 10.0),
              SwitchListTile(
                title: const Text('Notifications'),
                tileColor: Colors.white,
                value: isCheck2,
                onChanged: (bool value) {
                  setState(() {
                    isCheck2 = value;
                  });
                },
                activeColor: Colors.blue[700],
                // inactiveThumbColor: Colors.blue[700],
                inactiveTrackColor: Colors.white,
                secondary: const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 10.0),
              SwitchListTile(
                title: const Text('Night Mode'),
                tileColor: Colors.white,
                value: isCheck3,
                onChanged: (bool value) {
                  setState(() {
                    isCheck3 = value;
                  });
                },
                activeColor: Colors.blue[700],
                // inactiveThumbColor: Colors.blue[700],
                inactiveTrackColor: Colors.pink[300],
                secondary: const Icon(
                  Icons.mode_night_outlined,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 10.0),
              _buildSessionCutoms(
                  icons: Icons.language_outlined,
                  text: 'Language',
                  textCustoms: 'English'),
              const SizedBox(height: 10.0),
              _buildSessionCutoms(
                  icons: Icons.help_outline,
                  text: 'Support',
                  textCustoms: 'Get Help'),
              const SizedBox(height: 10.0),
              _buildSessionCutoms(
                  icons: Icons.verified_user_outlined,
                  text: 'Privacy Policy',
                  textCustoms: 'View'),
              const SizedBox(height: 10.0),
              _buildSessionCutoms(
                  icons: Icons.lock_outline_rounded,
                  text: 'Password',
                  textCustoms: 'Change'),
            ],
          ),
          bottomNavigationBar: const BottomNavBar(4),
        ),
      );

  Widget _buildSessionCutoms(
      {required IconData icons,
      required String text,
      required String textCustoms}) {
    const icon = Icons.chevron_right;
    Color clr = Colors.blue;
    Row object_1 = Row(
      children: [
        Icon(icons, color: Colors.brown, size: 27),
        Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 0, 0), child: Text(text,style:const  TextStyle(fontSize: 17),))
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
}
