import 'package:flutter/material.dart';

class Pages extends StatefulWidget{
  const Pages({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>PagesState();

}
class PagesState extends State<Pages>{
  @override 
  Widget build(BuildContext context){
    return const Text('trang page');
  }
}