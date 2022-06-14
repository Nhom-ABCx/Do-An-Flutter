import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback onPressed;
  final Widget child;

  const ElevatedButtonCustom({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 40,
    this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: child,
      ),
    );
  }
}
