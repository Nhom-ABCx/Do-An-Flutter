import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/all_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //bien xac dinh hinh
  int activeIndex = 0;
  //tao ds hinh anh cho banner
  final urlImages = ['images/banner/banner_1.png', 'images/banner/banner_2.png', 'images/banner/banner_3.png', 'images/banner/banner_4.png'];
  final Future<List<SanPham>> _dssanpham = fetchSanPham();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                      onPageChanged: (index, reason) => setState(() => activeIndex = index)),
                )
              ],
            )),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 30),
            child: const Text(
              'Product Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Wrap(
            children: [
              buildIconButton(context,Icons.phone_android_rounded, Colors.red, "Phone","/PhonePage"),
               buildIconButton(context,Icons.watch_later_outlined, Colors.blue, "LapTop","/LapTopPage"),
              // buildIconButton(Icons.fastfood_outlined, Colors.yellow, "Foods"),
              // buildIconButton(Icons.sports_esports, Colors.green, "Sports"),
              // buildIconButton(Icons.headphones_battery_outlined, Colors.yellow, "Gadgets"),
              // buildIconButton(Icons.wb_sunny_outlined, Colors.cyan, "Travel"),
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        //loi~ ko hien thi duoc hinh` la` do database dung dot giua .jpg.png
        //tren android studio ko biet nhu nao` ma` no bi loi~ lay du lieu API
        SizedBox(
          height: 250,
          //la 1 danh sach san pham o tuong lai khi lay ve duoc du lieu
          child: FutureBuilder<List<SanPham>>(
            future: _dssanpham, //danh sach san pham tu` tuong lai
            builder: (context, snapshot) {
              //cai phan nay la tu google
              if (snapshot.hasError) {
                //neu no'co' bat' ki` loi~ thi inh ra
                // ignore: avoid_print
                print(snapshot.error);
              }
              return snapshot.hasData //neu' co' du~ lieu thi xay dung ListView
                  ? ListView.separated(
                      padding: const EdgeInsets.all(20),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildItem(context,snapshot.data![index]),
                      separatorBuilder: (context, _) => const SizedBox(
                            width: 15, //khoang cach giua cac'layout
                          ),
                      //tra ve so luong phan tu trong danh sach
                      itemCount: snapshot.data!.length)
                  //ko co' du~ lieu thi`cho icon xoay long` vong`
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ),
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
