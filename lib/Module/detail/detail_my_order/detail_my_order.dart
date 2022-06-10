
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuillPageState extends StatelessWidget {
   BuillPageState({Key? key,required this.selectedPage}) : super(key: key);
  int selectedPage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  theme:  ThemeData(
    primarySwatch: Colors.teal,
  ),
  // home: DefaultTabController(
  //   length: 0,
  //   child:  Scaffold(
  //     appBar:  AppBar(
  //       leading: Icon(Icons.home),
  //       title:  Text("Home"),
  //       bottom:  TabBar(
  //         controller: _controller,
  //         tabs: _tabs,
  //       ),
  //     ),
  //     body: TabBarView(
  //       controller: _controller,
  //       children: _pages,
  //     ),
  //   )
  // ),
    );
  }
}