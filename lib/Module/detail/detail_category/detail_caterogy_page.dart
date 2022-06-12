import 'package:do_an_flutter/Model/loai_san_pham.dart';
import 'package:do_an_flutter/Module/detail/detail_category/detail_category_controller.dart';
import 'package:do_an_flutter/Widget/product_card_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Model/san_pham.dart';

// ignore: must_be_immutable
class DetailCaterogy extends StatelessWidget {
  const DetailCaterogy({Key? key, required this.typeProduct}) : super(key: key);
  final LoaiSanPham typeProduct;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetaileCategoryController());

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
                  typeProduct.tenLoai!,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                FutureBuilder<List<SanPham>?>(
                  future: controller.getListPrdtoType(typeProduct.id!),
                  builder: (context, snapshot) {
                    {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) return const SizedBox.shrink(); //show emty widget
                        print(snapshot.data!.length);
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          separatorBuilder: (context, _) => const SizedBox(width: 0),
                          itemBuilder: (context, index) => ProductCard3(snapshot.data![index]),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
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
