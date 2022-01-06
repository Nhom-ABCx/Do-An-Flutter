import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToPayTab extends StatefulWidget {
  const ToPayTab({Key? key}) : super(key: key);

  @override
  _ToPayTabState createState() => _ToPayTabState();
}

class _ToPayTabState extends State<ToPayTab> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/icons/idea.svg",
              width: 200,
              height: 200,
            ),
            const Text(
              "There are no orders place yet.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                width: 200,
                height: 50.0,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(colors: [
                      Colors.red,
                      Colors.orange,
                    ]),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.pink,
                        blurRadius: 16.0,
                      ),
                    ]),
                child: const Text("Continute Shopping", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
          ],
        ),
      ));
}
