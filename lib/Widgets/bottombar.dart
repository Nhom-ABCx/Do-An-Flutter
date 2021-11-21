import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  const BottomNavBar(this.currentIndex, {Key? key}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //ko cho no thu nho? mat chu~
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/Home'),
                icon: const Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/Support'),
                icon: const Icon(Icons.support)),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/Cart'),
                icon: const Icon(Icons.shopping_cart)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/Pages'),
                icon: const Icon(Icons.favorite_outline)),
            label: 'Page',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/Setting'),
                icon: const Icon(Icons.settings)),
            label: 'Setting',
          ),
        ],
        currentIndex: widget.currentIndex,
        selectedItemColor: Colors.green,
      );
}
