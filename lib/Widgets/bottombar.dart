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
                onPressed: () => Navigator.of(context).pushReplacementNamedIfNotCurrent('/Home'),
                //Navigator.pushReplacementNamed(context, '/Home'),
                icon: const Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Navigator.of(context).pushReplacementNamedIfNotCurrent('/Support'),
                //Navigator.pushReplacementNamed(context, '/Support'),
                icon: const Icon(Icons.support)),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Navigator.of(context).pushReplacementNamedIfNotCurrent('/Cart'),
                //Navigator.pushReplacementNamed(context, '/Cart'),
                icon: const Icon(Icons.shopping_cart)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Navigator.of(context).pushReplacementNamedIfNotCurrent('/Pages'),
                //Navigator.pushReplacementNamed(context, '/Pages'),
                icon: const Icon(Icons.favorite_outline)),
            label: 'Page',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () => Navigator.of(context).pushReplacementNamedIfNotCurrent('/Setting'),
                //Navigator.pushReplacementNamed(context, '/Setting'),
                icon: const Icon(Icons.settings)),
            label: 'Setting',
          ),
        ],
        currentIndex: widget.currentIndex,
        selectedItemColor: Colors.indigo,
      );
}

//ham nay kiem tra neu' dang o route nay` r thi ko can` phai tao moi lai
//cai nay tham khao tu google nen cung ko ro~, vi du su dung:
//Navigator.of(context).pushNamedIfNotCurrent('/Setting'),
extension NavigatorStateExtension on NavigatorState {
  //them 1 phuong thuc'moi'
  void pushNamedIfNotCurrent(String routeName, {Object? arguments}) {
    if (!isCurrent(routeName)) {
      pushNamed(routeName, arguments: arguments);
    }
  }

  void pushReplacementNamedIfNotCurrent(String routeName, {Object? arguments}) {
    if (!isCurrent(routeName)) {
      pushReplacementNamed(routeName, arguments: arguments);
    }
  }

  //neu dang o route thi tra ve true
  bool isCurrent(String routeName) {
    bool isCurrent = false;
    popUntil((route) {
      //huy? va chi giuu lai route dang chon
      if (route.settings.name == routeName) {
        isCurrent = true;
      }
      return true;
    });
    return isCurrent;
  }
}
