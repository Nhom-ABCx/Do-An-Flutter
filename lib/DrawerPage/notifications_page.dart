import 'package:flutter/material.dart';

class Notifications extends StatefulWidget{
  const Notifications({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>NotificationsState();

}
class NotificationsState extends State<Notifications>{
  @override 
  Widget build(BuildContext context){
    return const Text('Thông báo');
  }
}