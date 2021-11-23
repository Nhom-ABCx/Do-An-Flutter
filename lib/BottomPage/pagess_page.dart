import 'package:flutter/material.dart';
import 'dart:math';

class Loder extends StatefulWidget {
  const Loder({Key? key}) : super(key: key);

  @override
  _LoderState createState() => _LoderState();
}

class _LoderState extends State<Loder> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation_rotation;
  late final double initRadius = 30.0;
  double radius = 0.0;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
   
    animation_rotation= Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.0, 0.25, curve: Curves.elasticOut)));

    animationController.addListener(() {
      setState(() {
        if (animationController.value >= 0.75 &&
            animationController.value <= 1.0) {
          radius = animationController.value * initRadius;
        } else if (animationController.value >= 0.0 &&
            animationController.value <= 0.25) {
          radius = animationController.value * initRadius;
        }
      });
    });
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x0ff32a00),
      body: SizedBox(
        width: 100.0,
        height: 100.0,
        child: Center(
          child: RotationTransition(
            turns: animation_rotation,
            child: Stack(
              children: [
                 Image.asset('images/logo/logo-white.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
