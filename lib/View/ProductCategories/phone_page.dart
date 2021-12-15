import 'package:flutter/material.dart';
import '../../all_page.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {


  
   @override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget _lstView = Column(
      children: [
        SizedBox(
          height: 350,
          child: FutureBuilder<List<SanPham>>(
              future: fetchSanPhamDienThoai(),
              builder: (context,snapshot) {
                if (snapshot.hasError) {
                  // ignore: avoid_print
                  print(snapshot.error);
                }
                return snapshot.hasData 
                ? GridView.builder(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                 ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => buildItem(context,snapshot.data![index]),
                 )
                :const CircularProgressIndicator();
              }
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
          //body
          body: Column(
            children: [
              BannerPagePhone(),
              Padding(padding: const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 5.0),
              child: _lstView,
              )
            ],
          ),
           //Footer
           bottomNavigationBar: const BottomNavBar(0)),
            
    );
  }
}


// ignore: non_constant_identifier_names
Widget BannerPagePhone() => Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
    child: Image.asset("images/banner/banner_4.png"));
