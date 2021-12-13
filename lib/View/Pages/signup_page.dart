import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //text input

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                      top: 10,
                      right: 20,
                      bottom: 10,
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        //border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: "Username",
                        hintText: "create username",
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon:
                            Icon(Icons.supervisor_account, color: Colors.white),
                      ),
                      controller: input1, //gan gia tri cua text vao bien'
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
                      decoration: const InputDecoration(
                        //border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: "Email",
                        hintText: "yourEmail@gmail.com",
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.email, color: Colors.white),
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
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
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
                      child: const Text('Sign Up',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      onPressed: () {
                        //Navigator.pushNamed(context, 'Sign_In');
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
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, '/Sign_In'),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      );
}
