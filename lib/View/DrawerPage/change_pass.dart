import 'package:flutter/material.dart';
import '/all_page.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChangePassState();
}

class ChangePassState extends State<ChangePass> {
  final _editMyController = EditMyProfileController();
  final txtOldMatKhau = TextEditingController();
  final txtNewMatKhau = TextEditingController();
  final txtConfirmMatKhau = TextEditingController();

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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      children: [
                        topMyprofile(),
                        ColoredBox(
                          color: Colors.white70,
                          child: Column(children: [
                            StreamBuilder(
                                stream: _editMyController.oldmatkhauController.stream,
                                builder: (context, snapshot) => buildInputTextMyProfile(snapshot,
                                    icon: Icons.vpn_key,
                                    title: 'Old Password',
                                    txtController: txtOldMatKhau)),
                            StreamBuilder(
                                stream: _editMyController.newmatkhauController.stream,
                                builder: (context, snapshot) => buildInputTextMyProfile(snapshot,
                                    icon: Icons.vpn_key,
                                    title: 'New Password',
                                    txtController: txtNewMatKhau)),
                            StreamBuilder(
                                stream: _editMyController.confirmmatkhauController.stream,
                                builder: (context, snapshot) => buildInputTextMyProfile(snapshot,
                                    icon: Icons.vpn_key,
                                    title: 'Reapeat New Password',
                                    txtController: txtConfirmMatKhau)),
                            SizedBox(
                                //tu dong canh le`tu thiet bi
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  child: const Text(
                                    'Update Password',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  onPressed: () async {
                                    if (await _editMyController.ktUpdateKhachHang_MatKhau(
                                        txtOldMatKhau.text,
                                        txtNewMatKhau.text,
                                        txtConfirmMatKhau.text)) {
                                      thongBaoScaffoldMessenger(
                                          context, "Update Password Successful");
                                      //reload page
                                      (context as Element).reassemble();
                                    } else {
                                      thongBaoScaffoldMessenger(context, "Update Password Fails");
                                    }
                                  },
                                )),
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
