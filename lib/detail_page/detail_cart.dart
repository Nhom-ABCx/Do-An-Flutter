import 'package:flutter/material.dart';

class Cart extends StatefulWidget{
  const Cart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>CartState();

}
class CartState extends State<Cart>{
  @override 
  Widget build(BuildContext context){
    return const Text('trang Cart');
  }
}