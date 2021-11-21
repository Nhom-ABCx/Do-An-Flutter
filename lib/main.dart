import 'package:flutter/material.dart';
import 'package:flutter_application_1/DrawerPage/change_pass.dart';
import 'package:flutter_application_1/DrawerPage/notifications_page.dart';
import 'package:flutter_application_1/Pages/forgot_action.dart';
import 'package:flutter_application_1/Pages/forgot_page.dart';
import 'Pages/all_page.dart'; //lam` v cho no' nho? ra

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
        '/Forgot': (context) => const ForgotPage(),
        '/Forgot_action': (context) => const ForgotAction(),
        '/Home': (context) => const HomePage(),
        '/Cart': (context) => const CartPage(),
        '/Pages': (context) => const Pages(),
        '/Setting': (context) => const SettingPage(),
        '/Support': (context) => const SupportPage(),
        '/MyProfile': (context) => const MyProfile(),
        '/Notifications':(context)=>const Notifications(),
        '/ChangePW': (context) => const ChangePass(),
      },
    );
  }
}
