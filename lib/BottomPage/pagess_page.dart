// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'dart:async';

class Pages extends StatefulWidget{
  const Pages({Key? key}) : super(key: key);
  // ignore: unused_field
  
  @override
  State<StatefulWidget> createState()=>PagesState();

}
class PagesState extends State<Pages>{
  final List<String> _imageBanner=[
       'images/banner/banner_1.png',
       'images/banner/banner_2.png',
  ];
int _pos=0;
// ignore: unused_field
late Timer _timer;
//String sampleText ='images/banner/banner_1.jpg' ;
@override
  initState(){
  _timer=new Timer(const Duration(seconds: 5),(){

    setState(() {
      _pos=(_pos+1)%_imageBanner.length;
    });
  });
   super.initState();
}

@override
 void dispose(){
   _timer.cancel();
   super.dispose();
 }
  @override 
  Widget build(BuildContext context){
    return new Image.asset(
             _imageBanner[_pos],
            );
  }
}
//  Widget _banner=Container(
//       child: Column(children: [
//         Stack(
//           children: [
//             Image.asset('images/banner/banner_2.png'),
//             Positioned(
//               top: 25,
//               right: 20,
//               child: Container(
//                   // height: 100,  
//                   // width: 150,
//                   child: IconButton(onPressed: (){
//                     Image.asset(_imageBanner[_pos]);
//                   },
//                    icon: const Icon(Icons.arrow_right_outlined,
//                    color: Colors.greenAccent,
//                    size: 50.0))
//               ),
//             ),
//               Positioned(
//               top: 25,
//               left: 20,
//               child: Container(
//                   // width: 150,
//                   // height: 100,  
//                   child: IconButton(onPressed: (){
//                     Image.asset(_imageBanner[_pos]);
//                   },
//                    icon: const Icon(Icons.arrow_left_outlined,
//                    color: Colors.greenAccent,
//                    size: 50.0))
//               ),
//             )
//           ],
//         ),
//       ],),
//     );