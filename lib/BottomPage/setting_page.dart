import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget{
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>SettingPageState();

}

class SettingPageState extends State<SettingPage>{
  bool isCheck1=true;
  bool isCheck2=true;
  bool isCheck3=true;

  @override 
  Widget build(BuildContext context){
    return GestureDetector(
      child: Column(
        children: [
            SwitchListTile(
              title:const Text('Availability'),
              value: isCheck1, 
              onChanged: (bool value){
                setState(() {
                  isCheck1=value;
                });
              },
              activeColor: Colors.blue[700],
              // inactiveThumbColor: Colors.blue[700],
               inactiveTrackColor: Colors.white,
              secondary: const Icon(Icons.check_box,
              color: Colors.brown,
              ),
            ),
            SwitchListTile(
              title:const Text('Notifications'),
              value: isCheck2, 
              onChanged: (bool value){
                setState(() {
                  isCheck2=value;
                });
              },
              activeColor: Colors.blue[700],
              // inactiveThumbColor: Colors.blue[700],
               inactiveTrackColor: Colors.white,
              secondary: const Icon(Icons.notifications_none_outlined,
              color: Colors.brown,
              ),
            ),
                SwitchListTile(
              title:const Text('Night Mode'),
              value: isCheck3, 
              onChanged: (bool value){
                setState(() {
                  isCheck3=value;
                });
              },
              activeColor: Colors.blue[700],
              // inactiveThumbColor: Colors.blue[700],
               inactiveTrackColor: Colors.pink[300],
              secondary: const Icon(Icons.mode_night_outlined,
              color: Colors.brown,
              ),
            ),
                   SwitchListTile(
              title:const Text('Language'),
              value: isCheck3, 
              onChanged: (bool value){
                setState(() {
                  isCheck3=value;
                });
              },
              activeColor: Colors.blue[700],
              // inactiveThumbColor: Colors.blue[700],
               inactiveTrackColor: Colors.pink[300],
              secondary: const Icon(Icons.language,
              color: Colors.brown,
              ),
            ),
            
        ],
      ),
    );
  }
}