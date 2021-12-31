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
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          //TopHeader
          appBar: AppBarPage(),
          //Hide
          //drawer: const NavigationDrawer(),
          //body
          body: SingleChildScrollView(
            child: Column(
              children: [TitlePageLapTop(), _buildLstLatop(context)],
            ),
          ),
          //Footer
          bottomNavigationBar: const BottomNavBar(0)),
    );
  }
}

// ignore: non_constant_identifier_names
Widget TitlePageLapTop() => const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
          child: Text(
            'LapTop',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigoAccent),
          )),
    );
// lst sản phẩm lap top
Widget _buildLstLatop(BuildContext context) => FutureBuilder<List<SanPham>>(
    future: api_SanPham_LoaiSanPham(3),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        // ignore: avoid_print
        print(snapshot.error);
      }
      return snapshot.hasData
          ? GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(5.0),
                    child: buildItem(context, snapshot.data![index]),
                  ))
          : const Center(
              child:
                  Padding(padding: EdgeInsets.only(top: 250), child: CircularProgressIndicator()));
    });
