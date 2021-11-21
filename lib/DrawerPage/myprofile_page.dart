import 'package:flutter/material.dart';
import '../Pages/all_page.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile> {
  //cac bien' de dung`, de? tam
  final txtTimKiem = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(),
          // //Hide
          // drawer: const NavigationDrawer(),
          //Body
          body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red.shade100,
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Row(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 10, 20),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'images/avt.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    '@designing-word',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Suha Jannat',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                        ColoredBox(
                          color: Colors.white70,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Column(children: [
                              _buildSesion(
                                  icon: Icons.account_circle_sharp,
                                  title: 'Username',
                                  lable: '@desiging-world'),
                              _buildSesion(
                                  icon: Icons.account_circle_sharp,
                                  title: 'Full Name',
                                  lable: 'SUHA JANNAT'),
                              _buildSesion(
                                  icon: Icons.phone,
                                  title: 'Phone',
                                  lable: '+880 000 111 222'),
                              _buildSesion(
                                  icon: Icons.email,
                                  title: 'Email Address',
                                  lable: 'care@exmple.com'),
                              _buildSesion(
                                  icon: Icons.gps_fixed,
                                  title: 'Shipping',
                                  lable: '28/C Green Road,BD'),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: const [
                                      Icon(
                                        Icons.star,
                                        size: 30,
                                        color: Colors.green,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 0, 0),
                                        child: Text(
                                          'My Oder',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ]),
                                    TextButton(
                                      onPressed: () {},
                                      child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          width: 60,
                                          height: 40,
                                          child: const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'View',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                    ),
                                  ]),
                              SizedBox(
                                //tu dong canh le`tu thiet bi
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ))
              ])),
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}

//ko tach duoc thang nay sang buildWidget, cha biet tai sao
Widget _buildSesion(
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
