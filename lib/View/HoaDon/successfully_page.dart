import 'package:flutter/material.dart';

class SuccessfullyPage extends StatefulWidget {
  const SuccessfullyPage({Key? key}) : super(key: key);

  @override
  _SuccessfullyPageState createState() => _SuccessfullyPageState();
}

class _SuccessfullyPageState extends State<SuccessfullyPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFF0d3bd1),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 75,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.check_circle,
                  size: 75,
                  color: Colors.yellow,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Payment Done',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
              child: Text(
                'We will notify you of all the details via email. Thank you!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              width: 150,
              child: TextButton(
                child: const Text('Buy Again', style: TextStyle(fontSize: 20, color: Colors.black)),
                onPressed: () => Navigator.pushReplacementNamed(context, '/Home'),
              ),
            ),
          ],
        ),
      ));
}
