import 'package:flutter/material.dart';

class Support extends StatefulWidget{
  const Support({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>SupportState();

}
class SupportState extends State<Support>{
  @override 
  Widget build(BuildContext context){
    return const Text('trang support');
  }
}