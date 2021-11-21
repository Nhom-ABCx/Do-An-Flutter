import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../Pages/all_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //tao ds hinh anh cho banner
  final urlImages = [
    'images/banner/banner_1.png',
    'images/banner/banner_2.png',
    'images/banner/banner_3.png',
    'images/banner/banner_4.png'
  ];
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
  @override
  Widget build(BuildContext context) {
    final _buildColumn1 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.phone_android_outlined,
              color: Colors.red,
              size: 30.0,
            )),
        const Text("Phone", style: TextStyle(color: Colors.white24)),
      ],
    );
    final _buildColumn2 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.laptop_chromebook,
              size: 30.0,
              color: Colors.lightBlueAccent,
            )),
        const Text(
          "Laptop",
          style: TextStyle(color: Colors.white24),
        ),
      ],
    );
    final _buildColumn3 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt,
              size: 30.0,
              color: Colors.yellowAccent,
            )),
        const Text(
          "Camera",
          style: TextStyle(color: Colors.white24),
        )
      ],
    );
    final _buildColumn4 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.eject,
              size: 30.0,
              color: Colors.greenAccent,
            )),
        const Text(
          "Camera",
          style: TextStyle(color: Colors.white24),
        ),
      ],
    );
    //Widget _sanPham=GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
    Widget _row1 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildColumn1, _buildColumn2, _buildColumn3],
    );
    Widget _row2 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildColumn4, _buildColumn1, _buildColumn2],
    );
    Container _flashsale = Container(
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        children: const [
          Icon(Icons.bolt_outlined),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Flash sale',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
    Widget _buildItem(SanPham _sp) {
      return SizedBox(
        width: 150,
        child: Column(
          children: [
            Expanded(
              child: Align(
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
            ),
            Text(
              _sp.TenSanPham,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    }

    Widget _listView = Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          //Slider cho cai banner
          child: CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = urlImages[index];
              return buildImage(urlImage, index);
            },
            options: CarouselOptions(
                height: 100,
                autoPlay: true, //tu dong chay
                //reverse: true, //dao? nguoc chay
                //autoPlayInterval: const Duration(seconds: 4), //mac dinh la 4
                enlargeCenterPage: true), //lam noi bat trung tam hinh`
          ),
        ),
        Container(
            margin: const EdgeInsets.only(right: 150),
            child: const Text(
              'Product Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _row1,
              _row2,
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _flashsale,
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '56d 19h 29m 24s',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
              padding: const EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _buildItem(_dssanpham[index]),
              separatorBuilder: (context, _) => const SizedBox(
                    width: 15, //khoang cach giua cac'layout
                  ),
              itemCount: _dssanpham.length),
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
              padding: const EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _buildItem(_dssanpham[index]),
              separatorBuilder: (context, _) => const SizedBox(
                    width: 15, //khoang cach giua cac'layout
                  ),
              itemCount: _dssanpham.length),
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
              padding: const EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _buildItem(_dssanpham[index]),
              separatorBuilder: (context, _) => const SizedBox(
                    width: 15, //khoang cach giua cac'layout
                  ),
              itemCount: _dssanpham.length),
        )
      ],
    );
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //TopHeader
        appBar: AppBarPage(),
        //Hide
        drawer: const NavigationDrawer(),
        //Body
        body: SingleChildScrollView(
          child: Column(
            children: [
              _listView,
            ],
          ),
        ),
        //Footer
        bottomNavigationBar: const BottomNavBar(0),
      ),
    );
  }
}

class SanPham {
  // ignore: non_constant_identifier_names
  String TenSanPham;
  // ignore: non_constant_identifier_names
  String HinhAnh;

//gan` nhu phuong thuc khoi tao
  SanPham({
    // ignore: non_constant_identifier_names
    required this.TenSanPham,
    // ignore: non_constant_identifier_names
    required this.HinhAnh,
  });
}

Widget buildImage(String _urlImage, int index) => Container(
      //margin: const EdgeInsets.symmetric(horizontal: 24),
      color: Colors.grey,
      child: Image.asset(
        _urlImage,
        width: 360,
        fit: BoxFit.cover,
      ),
    );
