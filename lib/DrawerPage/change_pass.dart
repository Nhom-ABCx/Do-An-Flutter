import 'package:flutter/material.dart';
import '../Pages/all_page.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChangePassState();
}

class ChangePassState extends State<ChangePass> {
  //cac bien' de dung`, de? tam
  final txtTimKiem = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
           appBar: AppBarPage(),
          // //Hide
          // drawer: const NavigationDrawer(),
          //Body
          body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red.shade100,
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Row(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 10, 20),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'images/avt.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    '@designing-word',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Suha Jannat',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                        ColoredBox(
                          color: Colors.white70,
                          child: Column(children: [
                            _buildSesion(
                                icon: Icons.vpn_key,
                                title: 'Old PassWord',
                                lable: ''),
                              const Padding(padding: 
                              EdgeInsets.all(4),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                ),),
                                _buildSesion(
                                icon: Icons.vpn_key,
                                title: 'New PassWord',
                                lable: ''),
                              const Padding(
                              padding: EdgeInsets.all(0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                ),),
                                _buildSesion(
                                icon: Icons.vpn_key,
                                title: 'Reapeat New PassWord',
                                lable: ''),
                              const Padding(padding: 
                              EdgeInsets.all(4),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                ),),
                            
                            
                            SizedBox(
                              //tu dong canh le`tu thiet bi
                              width: MediaQuery.of(context).size.width,
                              child: 
                              ElevatedButton(
                                onPressed: () {}, 
                                child: Text('Update PassWord'),
                                )
                              // ElevatedButton.icon(
                              //   onPressed: () {},
                              //   icon: const Icon(
                              //     Icons.edit,
                              //     color: Colors.white,
                              //   ),
                              //   label: const Text(
                              //     'Update New PassWord',
                              //     style: TextStyle(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}

        Widget _buildSesion(
            {required IconData icon, required String title, required String lable}) {
          const color = Colors.green;
          const colorText = Colors.black;
          const padding = EdgeInsets.fromLTRB(0, 10, 0, 10);
          final item1 = Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: color,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(title,
                    style: const TextStyle(
                        color: colorText, fontSize: 15, fontWeight: FontWeight.bold)),
              )
            ],
          );
          return Padding(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item1,
                Text(lable,
                    style: const TextStyle(
                      color: colorText,
                    ))
              ],
            ),
          );
        }
