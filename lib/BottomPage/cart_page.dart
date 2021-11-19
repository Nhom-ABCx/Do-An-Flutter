import 'package:flutter/material.dart';

class CartPage extends StatefulWidget{
  const CartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>CartPageState();

}
class CartPageState extends State<CartPage>{
  @override 
  Widget build(BuildContext context){
    return const Text('trang Cart');
  }
}