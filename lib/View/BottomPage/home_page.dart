// ignore_for_file: unnecessary_this

import 'dart:ui';

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
  final urlImages = [
    "http://10.0.2.2:8000/storage/assets/images/banner/banner_1.png",
    'http://10.0.2.2:8000/storage/assets/images/banner/banner_2.png',
    //'http://10.0.2.2:8000/storage/assets/images/banner/banner_3.png',
    //'http://10.0.2.2:8000/storage/assets/images/banner/banner_4.png'
  ];
  //final Future<List<SanPham>> _dssanpham = fetchSanPham();
  @override
  void initState() {
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

    Widget _listView = Column(children: [
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
                    return buildImageBanner(urlImage, index);
                  },
                  options: CarouselOptions(
                    height: 100,
                    autoPlay: true, //tu dong chay
                    //reverse: true, //dao? nguoc chay
                    //autoPlayInterval: const Duration(seconds: 4), //mac dinh la 4
                    enlargeCenterPage: true, //lam noi bat trung tam hinh`
                    //onPageChanged: (index, reason) => setState(() => activeIndex = index)),
                  )),
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
      buildIconProductCategori(context),
      _flashsale,
      // Sản phẩm flash sale
      buildSanPhamFlashsale(context),
    ]);
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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Top Products',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child:
                          // ignore: deprecated_member_use
                          FlatButton(
                        onPressed: () {},
                        child: const Text(
                          'View All',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              // Sản phẩm top

              _builProductTop(context)
              // buildSanPhamTop(context)
            ],
          ),
        ),
        //Footer
        bottomNavigationBar: const BottomNavBar(0),
      ),
    );
  }
}

//icon product categori
Widget buildIconProductCategori(BuildContext context) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Wrap(
        children: [
          buildIconButton(context, Icons.phone_android_rounded, Colors.red,
              "Phone", "/PhonePage"),
          buildIconButton(context, Icons.laptop_chromebook_sharp, Colors.blue,
              "LapTop", "/LapTopPage"),
          // buildIconButton(Icons.fastfood_outlined, Colors.yellow, "Foods"),
          // buildIconButton(Icons.sports_esports, Colors.green, "Sports"),
          // buildIconButton(Icons.headphones_battery_outlined, Colors.yellow, "Gadgets"),
          // buildIconButton(Icons.wb_sunny_outlined, Colors.cyan, "Travel"),
        ],
      ),
    );

//Text flash sale
Widget _flashsale() => Container(
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
    );

// Sản phẩm flash sale
Widget buildSanPhamFlashsale(BuildContext context) {
  return //loi~ ko hien thi duoc hinh` la` do database dung dot giua .jpg.png
      //tren android studio ko biet nhu nao` ma` no bi loi~ lay du lieu API
      SizedBox(
    height: 250,
    //la 1 danh sach san pham o tuong lai khi lay ve duoc du lieu
    child: FutureBuilder<List<SanPham>>(
      future: fetchSanPhamSale(), //danh sach san pham tu` tuong lai
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
                itemBuilder: (context, index) => buildItem(context, snapshot.data![index]),
                separatorBuilder: (context, _) => const SizedBox(
                      width: 15, //khoang cach giua cac'layout
                    ),
                //tra ve so luong phan tu trong danh sach
                itemCount: snapshot.data!.length)
            //ko co' du~ lieu thi`cho icon xoay long` vong`
            : const Center(child: CircularProgressIndicator());
      },
    ),
  );
}

//Sản phẩm bán chạy
Widget _builProductTop(BuildContext context) => FutureBuilder<List<SanPham>>(
    future: fecthSanPhamBanChay(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      }
      return snapshot.hasData
          ? GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(5.0),
                    child: buildItem(context, snapshot.data![index]),
                  ))
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
