import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //text input

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBottomNavigation = 0;
  //cac bien' de dung`
  final txtTimKiem = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBar(
            title: Align(
              child: SizedBox(
                width: 250,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter your keyword",
                    prefixIcon: Icon(Icons.search),
                  ),
                  controller: txtTimKiem, //gan gia tri cua text vao bien'
                  textInputAction: TextInputAction.search,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(50), //gioi han do dai`
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications))
            ],
          ),
          //Hide
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'images/avt.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Đây là Việt Nammmmmmmmmmmmm',
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    )),
                const ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('My Profile'),
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notifications'),
                  trailing: Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 25,
                    child: const Text(
                      "3",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Sign Out'),
                ),
              ],
            ),
          ),
          //Body
          body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  const FlutterLogo(
                    size: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 20,
                      bottom: 10,
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Username",
                        hintText: "create username",
                        prefixIcon: Icon(Icons.supervisor_account),
                      ),
                      controller: txtTimKiem, //gan gia tri cua text vao bien'
                      textInputAction: TextInputAction.next,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(
                            255), //gioi han do dai`
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 20,
                      bottom: 10,
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "yourEmail@gmail.com",
                        prefixIcon: Icon(Icons.email),
                      ),
                      controller: txtTimKiem, //gan gia tri cua text vao bien'
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(
                            255), //gioi han do dai`
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 20,
                      bottom: 10,
                    ),
                    child: TextField(
                      obscureText: true, //hien * khi nhap text
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        prefixIcon: Icon(Icons.vpn_key),
                      ),
                      controller: txtTimKiem, //gan gia tri cua text vao bien'
                      textInputAction: TextInputAction.go,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(
                            255), //gioi han do dai`
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    width: 300,
                    child: TextButton(
                      child: const Text('Sign Up',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      onPressed: () {
                        //Navigator.pushNamed(context, 'Sign_In');
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/Sign_In'),
                      ),
                    ],
                  ),
                ],
              )),
          //Footer
          //cai phan` thanh cong cu o phia duoi'
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, //ko cho no thu nho? mat chu~
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.support),
                label: 'Support',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
            currentIndex: _selectedBottomNavigation,
            selectedItemColor: Colors.green,
            onTap: (index) => setState(() => _selectedBottomNavigation = index),
          ),
        ),
      );
}
