import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //format datetime
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
          body: RefreshIndicator(
            onRefresh: () async {
              //reload
              (context as Element).reassemble();
            },
            child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Column(
                        children: [
                          topMyprofile(),
                          ColoredBox(
                            color: Colors.white70,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(children: [
                                buildTextMyProfile(
                                    icon: Icons.account_circle_sharp,
                                    title: 'Username',
                                    lable: '@' + Auth.khachHang.username),
                                buildTextMyProfile(
                                    icon: Icons.contact_page,
                                    title: 'Full Name',
                                    lable: Auth.khachHang.hoTen!),
                                buildTextMyProfile(
                                    icon: Icons.phone,
                                    title: 'Phone',
                                    lable: '+' + Auth.khachHang.phone!),
                                buildTextMyProfile(
                                    icon: Icons.email,
                                    title: 'Email Address',
                                    lable: Auth.khachHang.email),
                                buildTextMyProfile(
                                    icon: Icons.gps_fixed,
                                    title: 'Address',
                                    lable: Auth.khachHang.diaChi!),
                                buildTextMyProfile(
                                    icon: Icons.date_range,
                                    title: 'Birthday',
                                    lable:
                                        DateFormat('yyyy-MM-dd').format(Auth.khachHang.ngaySinh!)),
                                buildTextMyProfile(
                                    icon:
                                        Auth.khachHang.gioiTinh!.isOdd ? Icons.male : Icons.female,
                                    title: 'Gender',
                                    lable: Auth.khachHang.gioiTinh!.isOdd ? "Male" : "Female"),
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
                                      style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          )
                        ],
                      ))
                ])),
          ),
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
