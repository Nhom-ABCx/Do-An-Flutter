import 'package:flutter/material.dart';
import 'Pages/signin_page.dart';
import 'Pages/signup_page.dart';
import 'Pages/wellcome_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DA Flutter',
      theme: ThemeData(
        brightness: Brightness.dark, //cai nen`trong
        primarySwatch: Colors.green, //cai nen`cua title ngoai`
      ),
      home: const WellcomePage(),
      routes: {
        '/Sign_In': (context) => const SignInPage(),
        '/Sign_Up': (context) => const SignUpPage(),
      },
    );
  }
}
