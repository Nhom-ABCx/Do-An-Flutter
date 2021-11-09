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
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                const FlutterLogo(
                  size: 100,
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
                      border: OutlineInputBorder(),
                      labelText: "Username",
                      hintText: "create username",
                      prefixIcon: Icon(Icons.supervisor_account),
                    ),
                    controller: input1, //gan gia tri cua text vao bien'
                    textInputAction: TextInputAction.next,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(255), //gioi han do dai`
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
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: "yourEmail@gmail.com",
                      prefixIcon: Icon(Icons.email),
                    ),
                    controller: input1, //gan gia tri cua text vao bien'
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(255), //gioi han do dai`
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
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.vpn_key),
                    ),
                    controller: input1, //gan gia tri cua text vao bien'
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(255), //gioi han do dai`
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
                    const Text("Already have an account?"),
                    TextButton(
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/Sign_In'),
                    ),
                  ],
                ),
              ],
            )),
      );
}
