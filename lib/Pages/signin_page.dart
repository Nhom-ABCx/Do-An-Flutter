// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //text input

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final input1 = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
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
                      top: 30,
                      right: 20,
                      bottom: 10,
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        //border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        labelText: "Email or Username",
                        hintText: "info@example.com",
                        prefixIcon: Icon(
                          Icons.supervisor_account,
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      controller: input1, //gan gia tri cua text vao bien'
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(
                            255), //gioi han do dai`
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 20,
                      bottom: 10,
                    ),
                    child: TextField(
                      obscureText: true, //hien * khi nhap text
                      decoration: const InputDecoration(
                        //border: OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      controller: input1, //gan gia tri cua text vao bien'
                      textInputAction: TextInputAction.go,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(
                            255), //gioi han do dai`
                      ],
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
                        //Navigator.pushNamed(context, 'Sign_In');
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
                        onPressed: () =>
                            Navigator.pushNamed(context, '/Sign_Up'),
                      ),
                    ],
                  ),
                  TextButton(
                    child: const Text(
                      "VIEW AS GUES",
                      style: TextStyle(fontSize: 17, color: Colors.amber),
                    ),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/Home'),
                  ),
                ],
              )),
        ),
      );
}
