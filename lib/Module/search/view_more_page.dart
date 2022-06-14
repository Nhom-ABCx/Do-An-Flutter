import 'package:do_an_flutter/Config/theme.dart';
import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:do_an_flutter/Widget/product_card_2.dart';
import 'package:do_an_flutter/Widget/product_card_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewMorePage extends StatelessWidget {
  const ViewMorePage({Key? key, required this.title, required this.listSanPham}) : super(key: key);
  final String title;
  final Future<List<SanPham>?> listSanPham;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //Hide
        //drawer: const NavigationDrawer(),
        body: SafeArea(
          child: RefreshIndicator(
              onRefresh: () async {
                //reload all widget
                // ignore: invalid_use_of_protected_member
                (context as Element).reassemble();
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    centerTitle: true,
                    title: Text(title, style: Theme.of(context).textTheme.titleLarge),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(ThemeConfig.defaultPaddingAll),
                    sliver: SliverToBoxAdapter(
                      child: FutureBuilder<List<SanPham>?>(
                        future: listSanPham,
                        builder: (context, snapshot) {
                          {
                            if (snapshot.hasError) {
                              print(snapshot.error);
                            }
                            if (snapshot.hasData) {
                              if (snapshot.data!.isEmpty) return khongCoGiHet(); //show emty widget
                              //else
                              RxBool defaultViewItem = true.obs;
                              return Obx(() => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Total: ${snapshot.data!.length}", style: Theme.of(context).textTheme.titleLarge),
                                          const Spacer(),
                                          IconButton(
                                            icon: Icon(
                                              Icons.grid_view,
                                              color: defaultViewItem.value ? Colors.red : null,
                                            ),
                                            onPressed: () => defaultViewItem.value = true,
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.view_list,
                                              color: !defaultViewItem.value ? Colors.red : null,
                                            ),
                                            onPressed: () => defaultViewItem.value = false,
                                          ),
                                        ],
                                      ),
                                      defaultViewItem.value
                                          ? GridView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: snapshot.data!.length,
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                //crossAxisSpacing: 0,
                                                //mainAxisSpacing: 10,
                                                childAspectRatio: 0.8,
                                              ),
                                              itemBuilder: (context, index) => ProductCard2(snapshot.data![index]))
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: snapshot.data!.length,
                                              itemBuilder: (context, index) => ProductCard3(snapshot.data![index])),
                                    ],
                                  ));
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
