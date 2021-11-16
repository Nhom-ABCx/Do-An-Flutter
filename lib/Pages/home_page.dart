import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'all_page.dart';

//text input
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //tạo ds widget cho bottom
  final List<Widget> _pages = <Widget>[];
  @override
  void initState() {
    _pages.add(const Home());
    _pages.add(const Support());
    _pages.add(const Card());
    _pages.add(const Pages());
    _pages.add(const Setting());
    super.initState();
  }

  //cai nay la khai bao' de chon Muc o phia' bottomNavi
  int _selectedBottomNavigation = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedBottomNavigation = index;
    });
  }

  //cac bien' de dung`, de? tam
  final txtTimKiem = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () {
          //sua lai loi~ hien luon keyboard khi nhan drawer
          final FocusScopeNode currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Scaffold(
          //TopHeader
          appBar: AppBar(
            title: SizedBox(
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
            centerTitle: true,
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
          body: Center(
            child: _pages.elementAt(_selectedBottomNavigation),
          ),
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
                icon: Icon(Icons.favorite_outline),
                label: 'Pages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
            currentIndex: _selectedBottomNavigation,
            selectedItemColor: Colors.green,
            onTap: _onItemTap,
          ),
        ),
      );
}
