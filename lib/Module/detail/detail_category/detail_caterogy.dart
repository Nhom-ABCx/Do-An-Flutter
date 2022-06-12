import 'package:do_an_flutter/Widget/product_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../Model/san_pham.dart';
import '../../home/home_controller.dart';

// ignore: must_be_immutable
class DetailCaterogy extends GetView<HomeController> {
  const DetailCaterogy({Key? key, required this.titlePage,required this.TypeProduct}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final titlePage;
  final TypeProduct;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          //Hide
          //drawer: const NavigationDrawer(),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                title: Text(
                  titlePage,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(
                  height: height,
                  child: FutureBuilder<List<SanPham>?>(
                    future: controller.listSanPhamDienThoai,
                    builder: (context, snapshot) {
                      {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) return const SizedBox.shrink(); //show emty widget
                          print(snapshot.data!.length);
                          return ListView.separated(
                            // scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            separatorBuilder: (context, _) => const SizedBox(width: 0),
                            itemBuilder: (context, index) => PrdCategory(sanPham: snapshot.data![index]),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
