import 'package:flutter/material.dart';
import '/all_page.dart';

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
                              color: Colors.orange[700],
                              border: Border.all(
                                color: Colors.red.shade100,
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    avtImageAsset(),
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
                                children: [
                                  Text(
                                    '@' + Auth.khachHang.username,
                                    style: const TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    Auth.khachHang.hoTen!,
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                              buildSesion(
                                  icon: Icons.account_circle_sharp,
                                  title: 'Username',
                                  lable: '@' + Auth.khachHang.username),
                              buildSesion(
                                  icon: Icons.account_circle_sharp,
                                  title: 'Full Name',
                                  lable: Auth.khachHang.hoTen!),
                              buildSesion(
                                  icon: Icons.phone,
                                  title: 'Phone',
                                  lable: '+' + Auth.khachHang.phone!),
                              buildSesion(
                                  icon: Icons.email,
                                  title: 'Email Address',
                                  lable: Auth.khachHang.email!),
                              buildSesion(
                                  icon: Icons.gps_fixed,
                                  title: 'Address',
                                  lable: Auth.khachHang.diaChi!),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Row(children: const [
                                  Icon(
                                    Icons.star,
                                    size: 30,
                                    color: Colors.green,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
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
                                          borderRadius: BorderRadius.all(Radius.circular(8))),
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
                                  onPressed: () => Navigator.pushNamed(context, '/EditMyProfile'),
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Edit Profile',
                                    style:
                                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
