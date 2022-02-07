import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../all_page.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            //end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.8, 0.9],
            colors: [
              //xin cai nen` tu` google
              Color(0xFF3594DD),
              Color(0xFF4563DB),
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              //alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32, bottom: 16),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 250,
                    child: TextButton(
                      child: const Text('Sign In', style: TextStyle(fontSize: 20, color: Colors.white)),
                      onPressed: () async {
                        showCustomLoadding();

                        if (await Auth.ktDaCoTaiKhoanDangNhap()) {
                          Navigator.pushReplacementNamed(context, '/Home');
                          EasyLoading.dismiss();
                        } else {
                          Navigator.pushReplacementNamed(context, '/Sign_In');
                          EasyLoading.dismiss();
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 0, bottom: 16),
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      border: Border.all(color: Colors.green),
                      // shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 250,
                    child: TextButton(
                      child: Text('Sign Up', style: TextStyle(fontSize: 20, color: Colors.green[100])),
                      onPressed: () => Navigator.pushReplacementNamed(context, '/Sign_Up'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Text(
                        'Language : ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'English',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
