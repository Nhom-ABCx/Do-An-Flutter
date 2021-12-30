import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../all_page.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  _PhonePageState createState() => _PhonePageState();
}

// khai bao cacs bien cho dropdown button
String dropdownvalue = "All";
List<String> items = ["All", "1tr-3tr", "3tr-7tr", "Trên 7tr"];

// class der thay doi lay ao theo mengh de chon dropdown
class ChangeLayOut extends ChangeNotifier {
  changeLayOut() {
    if (dropdownvalue == "All") {
      return fetchSanPhamDienThoai();
    }
    if (dropdownvalue == "1tr-3tr") {
      return fetchSanPhamDienThoai1_3tr();
    }
    if (dropdownvalue == "3tr-7tr") {
      return fetchSanPhamDienThoai3_7tr();
    }
    if (dropdownvalue == "Trên 7tr") {
      return fetchSanPhamDienThoai7tr();
    }
    notifyListeners();
  }
}

class _PhonePageState extends State<PhonePage> {
  @override
  Widget build(BuildContext context) {
    // sap xep theo gia
    Widget _buildShortPrice() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
                value: dropdownvalue,
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 30,
                ),
                items: items.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (String? val) {
                  setState(() {
                    dropdownvalue = val!;
                  });
                })
          ],
        );
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Consumer<ChangeLayOut>(
        builder: (context, clt, child) => Scaffold(
            //TopHeader
            appBar: AppBarPage(),
            //Hide
            drawer: const NavigationDrawer(),
            //body
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitlePagePhone(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: _buildShortPrice(),
                      )
                    ],
                  ),
                  // ds san pham dien thoai
                  FutureBuilder<List<SanPham>>(
                      future: clt.changeLayOut(),
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
                                child: Padding(
                                    padding: EdgeInsets.only(top: 250),
                                    child: CircularProgressIndicator()));
                      }),
                ],
              ),
            ),
            //Footer
            bottomNavigationBar: const BottomNavBar(0)),
      ),
    );
  }
}

//title page laptop
// ignore: non_constant_identifier_names
Widget TitlePagePhone() => const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
          child: Text(
            'Điện thoại',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigoAccent),
          )),
    );
