import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //text input

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
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
                      top: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        //border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: "Email or Username",
                        hintText: "info@example.com",
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.supervisor_account,
                          color: Colors.white,
                        ),
                      ),
                      controller: input1, //gan gia tri cua text vao bien'
                      keyboardType: TextInputType.emailAddress,
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
                      color: Colors.orange,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 300,
                    child: TextButton(
                      child: const Text('Reset password',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/Forgot_action'),
                    ),
                  ),
                ],
              )),
        ),
      );
}
