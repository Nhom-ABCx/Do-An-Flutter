import 'package:flutter/material.dart';
import '../../all_page.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({Key? key, required this.tenTimKiem}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  String tenTimKiem;
  @override
  Widget build(BuildContext context) {
    //title ket qua tim kiem
// ignore: non_constant_identifier_names
    Widget TitleSearchPage() => Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
              child: Text(
                'Kết quả tìm kiếm: $tenTimKiem',
                style: const TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: Colors.redAccent),
              )),
        );
// build ket qua request
    Widget _buildSearcProduct() => buildListSanPham(context, ftechSanPhamSearch(tenTimKiem));
    return GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(),
          //Hide
          //drawer: const NavigationDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [TitleSearchPage(), _buildSearcProduct()],
            ),
          ),
        ));
  }
}
