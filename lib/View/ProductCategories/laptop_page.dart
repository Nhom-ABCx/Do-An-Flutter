import 'package:flutter/material.dart';
import '../../all_page.dart';

class LapTopPage extends StatefulWidget {
  const LapTopPage({Key? key}) : super(key: key);

  @override
  _LapTopPageState createState() => _LapTopPageState();
}

class _LapTopPageState extends State<LapTopPage> {
  @override
  Widget build(BuildContext context) {
    Widget _lstView = Column(
      children: [
        SizedBox(
          height: 350,
          child: FutureBuilder<List<SanPham>>(
              future: fetchSanPhamLapTop(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // ignore: avoid_print
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.all(5.0),
                              child: buildItem(context, snapshot.data![index]),
                            ))
                    : const CircularProgressIndicator();
              }),
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
          //body
          body: Column(
            children: [
              BannerPageLapTop(),
              _lstView,
            ],
          ),
          //Footer
          bottomNavigationBar: const BottomNavBar(0)),
    );
  }
}

// ignore: non_constant_identifier_names
Widget BannerPageLapTop() => Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
    child: Image.asset("images/banner/banner_4.png"));
