import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/all_page.dart'; //text input

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _auth = Auth();
  final txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Theme(
          data: Theme.of(context).copyWith(
            textTheme: const TextTheme(
              subtitle1: TextStyle(color: Colors.white), // nhập text chữ trắng
            ),
          ),
          child: Scaffold(
            backgroundColor: const Color(0xFF0d3bd1),
            body: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: 'http://10.0.2.2:8000/storage/assets/images/logo/logo-white.png',
                      width: 80,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.black12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                        right: 20,
                        bottom: 10,
                      ),
                      child: StreamBuilder(
                        stream: _auth.emailController.stream,
                        builder: (context, snapshot) => TextField(
                          decoration: InputDecoration(
                            //border: OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelText: "Email or Username",
                            hintText: "info@example.com",
                            errorText: snapshot.hasError ? snapshot.error.toString() : null,
                            labelStyle: const TextStyle(color: Colors.white),
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(
                              Icons.supervisor_account,
                              color: Colors.white,
                            ),
                          ),
                          controller: txtEmail, //gan gia tri cua text vao bien'
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.go,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(255), //gioi han do dai`
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      width: 300,
                      child: TextButton(
                        child: const Text('Reset password',
                            style: TextStyle(fontSize: 20, color: Colors.black)),
                        onPressed: () async {
                          await (_auth.ktResetMK(txtEmail.text))
                              ? Navigator.pushNamed(context, '/Forgot_action')
                              : (thongBaoScaffoldMessenger(context, "Wrong Username or Password"));
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ),
      );
}
