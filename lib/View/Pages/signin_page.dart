// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/all_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>  {
  bool notShowPassword = true;
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final _auth = Auth();

  //animation logo
 // late AnimationController animationController;
  // ignore: non_constant_identifier_names
  //late Animation<double> animation_rotation;
  // ignore: non_constant_identifier_names
  //late Animation<double> animation_rotation_out;
  // @override
  // void initState() {
  //   super.initState();
  //   animationController = AnimationController(
  //       vsync: this, duration: const Duration(seconds: 6)); //cu sau 4s la thuc hien hieu ung

  //   animation_rotation = Tween<double>(begin: 0.0, end: 2.0).animate(CurvedAnimation(
  //       parent: animationController, curve: const Interval(0.0, 1.0, curve: Curves.elasticOut)));
  //   animation_rotation_out = Tween<double>(begin: 1.0, end: 2.0).animate(CurvedAnimation(
  //       parent: animationController, curve: const Interval(1.25, 1.75, curve: Curves.linear)));
  //   //cho hieu ung lap lai
  //   animationController.repeat();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _auth.dispose();
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
                    // RotationTransition(
                    //   turns: animation_rotation,
                    //   child: Stack(
                    //     children: [
                    //       Image.asset('images/logo/logo-white.png'),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 30,
                        right: 20,
                        bottom: 10,
                      ),
                      child: StreamBuilder(
                          stream: _auth.emailController.stream,
                          builder: (context, snapshot) => TextField(
                                decoration: InputDecoration(
                                  //border: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.grey),
                                  ),
                                  labelText: "Email or Username",
                                  hintText: "info@example.com",
                                  errorText: snapshot.hasError ? snapshot.error.toString() : null,
                                  prefixIcon: const Icon(
                                    Icons.supervisor_account,
                                    color: Colors.white,
                                  ),
                                  labelStyle: const TextStyle(color: Colors.white),
                                  hintStyle: const TextStyle(color: Colors.grey),
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
                                  borderSide: const BorderSide(color: Colors.grey),
                                ),
                                labelText: "Password",
                                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                                prefixIcon: const Icon(
                                  Icons.vpn_key,
                                  color: Colors.white,
                                ),
                                labelStyle: const TextStyle(color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.grey),
                              ),
                              controller: txtPassword, //gan gia tri cua text vao bien'
                              textInputAction: TextInputAction.go,
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(255), //gioi han do dai`
                              ],
                            ),
                            GestureDetector(
                              onTap: () => setState(() => notShowPassword = !notShowPassword),
                              child: Text(
                                notShowPassword ? "SHOW" : "HIDE",
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
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
                        color: Colors.green,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      width: 300,
                      child: TextButton(
                        child: const Text('Log In',
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                        onPressed: () {
                          (_auth.ktDangNhap(txtEmail.text, txtPassword.text))
                              ? Navigator.pushReplacementNamed(context, '/Home')
                              : null;
                        },
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/Forgot'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't have an account?",
                          style: TextStyle(fontSize: 15, color: Colors.grey[300]),
                        ),
                        TextButton(
                          child: const Text(
                            "Register Now",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          onPressed: () => Navigator.pushNamed(context, '/Sign_Up'),
                        ),
                      ],
                    ),
                    TextButton(
                      child: const Text(
                        "VIEW AS GUES",
                        style: TextStyle(fontSize: 17, color: Colors.amber),
                      ),
                      onPressed: () => Navigator.pushReplacementNamed(context, '/Home'),
                    ),
                  ],
                )),
          ),
        ),
      );
}
