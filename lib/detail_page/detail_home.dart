import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
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
        Container(
          child: const Text("Phone"),
          color: Colors.black45,
        ),
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
        Container(
          child: const Text("Laptop"),
          color: Colors.black45,
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
        Container(
          child: const Text("Camera"),
          color: Colors.black45,
        ),
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
        Container(
          child: const Text("Camera"),
          color: Colors.black45,
        ),
      ],
    );
    Widget _row1 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_buildColumn1, _buildColumn2, _buildColumn3],
    );
    Widget _row2 = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      return Container(
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
          padding: const EdgeInsets.all(15),
          child: Image.asset('images/banner/banner_2.png', fit: BoxFit.fill),
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
        _row1,
        _row2,
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _listView,
          ],
        ),
      ),
    );
  }
}

class SanPham {
  String TenSanPham;
  String HinhAnh;

//gan` nhu phuong thuc khoi tao
  SanPham({
    required this.TenSanPham,
    required this.HinhAnh,
  });
}
