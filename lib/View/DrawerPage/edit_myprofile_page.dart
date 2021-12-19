import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//datetime picker
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '/all_page.dart';

class EditMyProfile extends StatefulWidget {
  const EditMyProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EditMyProfileState();
}

class EditMyProfileState extends State<EditMyProfile> {
  //cac bien' de dung`, de? tam
  final _editMyController = EditMyProfileController();
  final txtUsername = TextEditingController(text: Auth.khachHang.username);
  final txtHoTen = TextEditingController(text: Auth.khachHang.hoTen!);
  final txtPhone = TextEditingController(text: Auth.khachHang.phone!);
  final txtEmail = TextEditingController(text: Auth.khachHang.email!);
  final txtDiaChi = TextEditingController(text: Auth.khachHang.diaChi!);
  DateTime txtNgaySinh = Auth.khachHang.ngaySinh!;
  bool txtGioiTinh = Auth.khachHang.gioiTinh!.isOdd;

  File? image;
  Future<void> pickImage() async {
    try {
      final imageeee = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageeee == null) return;

      final imgtemp = File(imageeee.path);
      setState(() => image = imgtemp);
    } catch (e) {
      print("Failed to pick image: $e");
    }
  }

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
                  onPressed: () => pickImage(),
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
                                          : Image.network(
                                              avtImageFix(),
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
                            StreamBuilder(
                                stream: _editMyController.usernameController.stream,
                                builder: (context, snapshot) => buildInputTextMyProfile(snapshot,
                                    icon: Icons.account_circle_sharp,
                                    title: 'Username',
                                    txtController: txtUsername)),
                            StreamBuilder(
                                stream: _editMyController.hotenController.stream,
                                builder: (context, snapshot) => buildInputTextMyProfile(snapshot,
                                    icon: Icons.contact_page,
                                    title: 'Full Name',
                                    txtController: txtHoTen)),
                            StreamBuilder(
                                stream: _editMyController.phoneController.stream,
                                builder: (context, snapshot) => buildInputTextMyProfile(snapshot,
                                    icon: Icons.phone,
                                    title: 'Phone',
                                    txtController: txtPhone,
                                    txtInputType: TextInputType.number,
                                    inputNumberOnly: true)),
                            StreamBuilder(
                                stream: _editMyController.emailController.stream,
                                builder: (context, snapshot) => buildInputTextMyProfile(snapshot,
                                    txtInputType: TextInputType.emailAddress,
                                    icon: Icons.email,
                                    title: 'Email Address',
                                    txtController: txtEmail)),
                            StreamBuilder(
                                stream: _editMyController.diachiController.stream,
                                builder: (context, snapshot) => buildInputTextMyProfile(snapshot,
                                    icon: Icons.gps_fixed,
                                    title: 'Address',
                                    txtController: txtDiaChi)),
                            Column(
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.green,
                                      size: 30,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Text("Birthday",
                                          style:
                                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                                DateTimeField(
                                  initialValue: txtNgaySinh, //gia tri mac dinh
                                  format: DateFormat("yyyy-MM-dd"),
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate: currentValue ?? txtNgaySinh,
                                            lastDate: DateTime.now())
                                        .then((value) => txtNgaySinh = value!);
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.transgender_outlined,
                                      color: Colors.green,
                                      size: 30,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Text("Gender",
                                          style:
                                              TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                                SwitchListTile(
                                    value: txtGioiTinh,
                                    title: Text(txtGioiTinh ? "Male" : "Female"),
                                    secondary: Icon(
                                      txtGioiTinh ? Icons.male : Icons.female,
                                      color: txtGioiTinh ? Colors.blue : Colors.pink,
                                      size: 30,
                                    ),
                                    activeColor: Colors.blue,
                                    inactiveThumbColor: Colors.pink,
                                    inactiveTrackColor: Colors.pink[200],
                                    onChanged: (value) {
                                      setState(() => txtGioiTinh = value);
                                    }),
                              ],
                            ),
                            SizedBox(
                              //tu dong canh le`tu thiet bi
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  final _khachHang = Auth.khachHang;
                                  _khachHang.username = txtUsername.text;
                                  _khachHang.hoTen = txtHoTen.text;
                                  _khachHang.phone = txtPhone.text;
                                  _khachHang.email = txtEmail.text;
                                  _khachHang.diaChi = txtDiaChi.text;
                                  _khachHang.ngaySinh = txtNgaySinh;
                                  _khachHang.gioiTinh = txtGioiTinh ? 1 : 0;

                                  if (await _editMyController.ktUpdateKhachHang(_khachHang)) {
                                    thongBaoScaffoldMessenger(context, "Update successful");
                                    //reload page
                                    (context as Element).reassemble();
                                  } else {
                                    thongBaoScaffoldMessenger(context, "Update Fails");
                                  }
                                },
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
