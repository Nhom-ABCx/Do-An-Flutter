import 'package:flutter/material.dart';

class ForgotAction extends StatefulWidget {
  const ForgotAction({Key? key}) : super(key: key);

  @override
  _ForgotActionState createState() => _ForgotActionState();
}

class _ForgotActionState extends State<ForgotAction> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sentiment_satisfied_alt,
              size: 75,
            ),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Password recovery email is sent successfully. Please check your inbox!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              width: 300,
              child: TextButton(
                child: const Text('Go home',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                onPressed: () => Navigator.popUntil(
                    context, ModalRoute.withName('/Sign_In')),
              ),
            ),
          ],
        ),
      ));
}
