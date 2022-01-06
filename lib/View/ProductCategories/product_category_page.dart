import 'package:flutter/material.dart';
import '../../all_page.dart';

class ProductCategoriesPage extends StatefulWidget {
  final int loaiSanPhamId;
  final String tenLoaiSanPham;
  const ProductCategoriesPage(this.tenLoaiSanPham, this.loaiSanPhamId, {Key? key}) : super(key: key);

  @override
  _ProductCategoriesPageState createState() => _ProductCategoriesPageState();
}

class _ProductCategoriesPageState extends State<ProductCategoriesPage> {
  late Future<List<SanPham>> apiSanPhamLoaiSanPham;
  @override
  void initState() {
    super.initState();
    apiSanPhamLoaiSanPham = api_SanPham_LoaiSanPham(widget.loaiSanPhamId);
  }

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
              children: [titlePageCategory(widget.tenLoaiSanPham), buildListSanPham(context, apiSanPhamLoaiSanPham)],
            ),
          ),
          //Footer
          bottomNavigationBar: const BottomNavBar(0)),
    );
  }
}
