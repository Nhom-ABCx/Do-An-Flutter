import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //text input

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //cai nay la khai bao' de chon Muc o phia' bottomNavi
  int _selectedBottomNavigation = 0;
  //Danh sach' SanPham
  final List<SanPham> _dssanpham = [
    SanPham(
        TenSanPham: 'SanPham 1', HinhAnh: 'images/product-image/DT/DT_1.jpg'),
    SanPham(
        TenSanPham: 'SanPham 2', HinhAnh: 'images/product-image/DT/DT_2.jpg'),
    SanPham(
        TenSanPham: 'SanPham 3', HinhAnh: 'images/product-image/DT/DT_3.jpg'),
    SanPham(
        TenSanPham: 'SanPham 44', HinhAnh: 'images/product-image/DT/DT_4.jpg'),
  ];
  //cac bien' de dung`, de? tam
  final txtTimKiem = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
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
          body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                        padding: const EdgeInsets.all(20),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            _buildItem(_dssanpham[index]),
                        separatorBuilder: (context, _) => const SizedBox(
                              width: 15, //khoang cach giua cac'layout
                            ),
                        itemCount: _dssanpham.length),
                  )
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

Widget _buildItem(SanPham _sp) => Container(
      width: 150,
      child: Column(
        children: [
          Expanded(
              child: AspectRatio(
            aspectRatio: 4 / 3, //cai nay de fix khi anh bi loi~
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                _sp.HinhAnh,
                fit: BoxFit.cover,
              ),
            ),
          )),
          Text(_sp.TenSanPham),
        ],
      ),
    );

//tao 1 cai Lop SanPham
class SanPham {
  String TenSanPham;
  String HinhAnh;

//gan` nhu phuong thuc khoi tao
  SanPham({
    required this.TenSanPham,
    required this.HinhAnh,
  });
}
