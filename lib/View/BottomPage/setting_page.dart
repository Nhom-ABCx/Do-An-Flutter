import 'package:flutter/material.dart';
import '/all_page.dart';

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
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
                    ),
                    child: SwitchListTile(
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
                        size: 30,
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
                    ),
                    child: SwitchListTile(
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
                        size: 30,
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
                    ),
                    child: SwitchListTile(
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
                        size: 30,
                      ),
                    )),
                buildListTitleSetting(
                    icons: Icons.import_contacts,
                    text: 'Address Management',
                    textCustoms: 'View',
                    onClicked: () => Navigator.pushNamed(context, "/AddressPage")),
                buildListTitleSetting(icons: Icons.language_outlined, text: 'Language', textCustoms: 'English', onClicked: () {}),
                buildListTitleSetting(icons: Icons.help_outline, text: 'Support', textCustoms: 'Get Help', onClicked: () {}),
                buildListTitleSetting(icons: Icons.verified_user_outlined, text: 'Privacy Policy', textCustoms: 'View', onClicked: () {}),
                buildListTitleSetting(
                    icons: Icons.pageview, text: 'All Page', textCustoms: 'View', onClicked: () => Navigator.pushNamed(context, "/Pages")),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavBar(4),
        ),
      );
}
