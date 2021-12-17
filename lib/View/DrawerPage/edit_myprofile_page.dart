import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '/all_page.dart';

class EditMyProfile extends StatefulWidget {
  const EditMyProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EditMyProfileState();
}

class EditMyProfileState extends State<EditMyProfile> {
  //cac bien' de dung`, de? tam
  final txtTimKiem = TextEditingController();
  File? image;
  Future<void> pickImage() async {
    try {
      final imageeee = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageeee == null) return;

      final imgtemp = File(imageeee.path);
      //final imgtemp = await saveImage(imageeee.path);
      setState(() => image = imgtemp);
    } catch (e) {
      print("Failed to pick image: $e");
    }
  }

  // Future<File> saveImage(String imagePath) async {
  //   //thu muc goc
  //   final directory = await getApplicationDocumentsDirectory();
  //   //lay ra cai ten cua thu muc, ro` vo la no co vi du
  //   final name = basename(imagePath);
  //   final urlImage = File('${directory.path}/$name');
  //   return File(imagePath).copy(urlImage.path);
  // }

  @override
  Widget build(BuildContext context) {
    //lay ra mau` chu dao cua theme
    final color = Theme.of(context).colorScheme.primary;

    Widget bottomSheetPick() {
      return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const Text(
              "Choose photo",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              TextButton(
                  onPressed: () => pickImage(),
                  child: Row(
                    children: const [Icon(Icons.camera_enhance), Text("Camera")],
                  )),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [Icon(Icons.image), Text("Gallery")],
                  )),
            ])
          ],
        ),
      );
    }

    return GestureDetector(
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
                            child: GestureDetector(
                              onTap: () => showModalBottomSheet(
                                  context: context, builder: ((builder) => bottomSheetPick())),
                              child: Stack(
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: image != null
                                          ? Image.file(
                                              image!,
                                              width: 125,
                                              height: 125,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              avtImageAsset(),
                                              width: 125,
                                              height: 125,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: buildCircle(
                                        color: Colors.white,
                                        all: 2,
                                        child: buildCircle(
                                          color: color,
                                          all: 5,
                                          child: const Icon(
                                            Icons.loyalty,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
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
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Save All Change',
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
}
