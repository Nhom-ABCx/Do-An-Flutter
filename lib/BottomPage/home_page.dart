import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Pages/all_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //bien xac dinh hinh
  int activeIndex = 0;
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

    Widget _listView = Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Slider cho cai banner
                CarouselSlider.builder(
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
                      enlargeCenterPage: true, //lam noi bat trung tam hinh`
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index)),
                )
              ],
            )),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Product Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Wrap(
            children: [
              buildIconButton(
                  Icons.favorite_border_outlined, Colors.red, "Woment's"),
              buildIconButton(Icons.watch_later_outlined, Colors.blue, "Juice"),
              buildIconButton(Icons.fastfood_outlined, Colors.yellow, "Foods"),
              buildIconButton(Icons.sports_esports, Colors.green, "Sports"),
              buildIconButton(
                  Icons.headphones_battery_outlined, Colors.yellow, "Gadgets"),
              buildIconButton(Icons.wb_sunny_outlined, Colors.cyan, "Travel"),
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

//ko tach duoc thang nay sang buildWidget, cha biet tai sao
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
