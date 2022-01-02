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
      return api_SanPham_LoaiSanPham(2);
    }
    if (dropdownvalue == "1tr-3tr") {
      return api_SanPham_GiaBan(2, 1000000, 3000000);
    }
    if (dropdownvalue == "3tr-7tr") {
      return api_SanPham_GiaBan(2, 3000000, 7000000);
    }
    if (dropdownvalue == "Trên 7tr") {
      return api_SanPham_GiaBan(2, 7000000, 0);
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
            //drawer: const NavigationDrawer(),
            //body
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titlePageCategory("Phone"),
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
                                      child: buildItem(snapshot.data![index]),
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