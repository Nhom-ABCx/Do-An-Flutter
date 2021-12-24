import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //text input
import '/all_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool notShowPassword = true;
  final _auth = Auth();
  final txtUsername = TextEditingController(text: "asd");
  final txtEmail = TextEditingController(text: "asd@gmail.com");
  final txtPassword = TextEditingController(text: "asd");

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _auth.dispose();
    txtUsername.dispose();
    txtEmail.dispose();
    txtPassword.dispose();
  }

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
                    Image.asset(
                      'images/logo/logo-white.png',
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 20,
                        bottom: 10,
                      ),
                      child: StreamBuilder(
                          stream: _auth.nameController.stream,
                          builder: (context, snapshot) => TextField(
                                decoration: InputDecoration(
                                  //border: OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  labelText: "Username",
                                  hintText: "create username",
                                  errorText: snapshot.hasError ? snapshot.error.toString() : null,
                                  labelStyle: const TextStyle(color: Colors.white),
                                  hintStyle: const TextStyle(color: Colors.grey),
                                  prefixIcon:
                                      const Icon(Icons.supervisor_account, color: Colors.white),
                                ),
                                controller: txtUsername, //gan gia tri cua text vao bien'
                                textInputAction: TextInputAction.next,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(255), //gioi han do dai`
                                ],
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 10,
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
                                  labelText: "Email",
                                  hintText: "yourEmail@gmail.com",
                                  errorText: snapshot.hasError ? snapshot.error.toString() : null,
                                  labelStyle: const TextStyle(color: Colors.white),
                                  hintStyle: const TextStyle(color: Colors.grey),
                                  prefixIcon: const Icon(Icons.email, color: Colors.white),
                                ),
                                controller: txtEmail, //gan gia tri cua text vao bien'
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(255), //gioi han do dai`
                                ],
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                        right: 20,
                        bottom: 10,
                      ),
                      child: StreamBuilder(
                          stream: _auth.passController.stream,
                          builder: (context, snapshot) => Stack(
                                alignment: AlignmentDirectional.centerEnd,
                                children: [
                                  TextField(
                                    obscureText: notShowPassword, //hien * khi nhap text
                                    decoration: InputDecoration(
                                      //border: OutlineInputBorder(),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                      ),
                                      labelText: "Password",
                                      errorText:
                                          snapshot.hasError ? snapshot.error.toString() : null,
                                      labelStyle: const TextStyle(color: Colors.white),
                                      prefixIcon: const Icon(
                                        Icons.vpn_key,
                                        color: Colors.white,
                                      ),
                                    ),
                                    controller: txtPassword, //gan gia tri cua text vao bien'
                                    textInputAction: TextInputAction.go,
                                    inputFormatters: <TextInputFormatter>[
                                      LengthLimitingTextInputFormatter(255), //gioi han do dai`
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () => setState(() => notShowPassword = !notShowPassword),
                                    child: notShowPassword
                                        ? const Icon(
                                            Icons.visibility,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: Colors.white,
                                          ),
                                  ),
                                ],
                              )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      width: 300,
                      child: TextButton(
                        child: const Text('Sign Up',
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                        onPressed: () async {
                          await (_auth.ktDangKy(txtUsername.text, txtEmail.text, txtPassword.text))
                              ? Navigator.pushReplacementNamed(context, '/Home')
                              : (thongBaoScaffoldMessenger(context, "Create account Fails !"));
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 15, color: Colors.grey[300]),
                        ),
                        TextButton(
                          child: const Text(
                            "Sign In",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          onPressed: () => Navigator.pushReplacementNamed(context, '/Sign_In'),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      );
}
