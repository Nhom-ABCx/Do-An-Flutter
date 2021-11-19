import 'package:flutter/material.dart';
import 'all_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //tạo ds widget cho bottomNavi
  final List<Widget> _pageBottom = <Widget>[];
  //cai nay la khai bao' de chon Muc o phia' bottomNavi
  int _selectedBottomNavigation = 0;

  @override
  void initState() {
    _pageBottom.add(const IndexPage());
    _pageBottom.add(const SupportPage());
    _pageBottom.add(const CartPage());
    _pageBottom.add(const Pages());
    _pageBottom.add(const SettingPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(),
          //Hide
          drawer: const NavigationDrawer(),
          //Body
          body: _pageBottom.elementAt(_selectedBottomNavigation),
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
            onTap: (index) => setState(() => _selectedBottomNavigation = index),
          ),
        ),
      );
}
