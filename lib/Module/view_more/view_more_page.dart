import 'package:do_an_flutter/Config/theme.dart';
import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:do_an_flutter/Module/view_more/view_more_controller.dart';
import 'package:do_an_flutter/Widget/product_card_2.dart';
import 'package:do_an_flutter/Widget/product_card_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewMorePage extends GetView<ViewMoreController> {
  const ViewMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool defaultViewItem = true.obs;
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
              child: Obx(
                () => CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      title: Text(controller.infoPage["name"]),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Padding(
                          padding: const EdgeInsets.all(ThemeConfig.defaultPaddingAll),
                          child: Row(
                            children: [
                              Text("Total: ${controller.listSanPham.length}", style: Theme.of(context).textTheme.titleLarge),
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
                          )),
                      defaultViewItem.value
                          ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: ThemeConfig.defaultPaddingAll),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.listSanPham.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    //crossAxisSpacing: 0,
                                    //mainAxisSpacing: 10,
                                    childAspectRatio: 0.8,
                                  ),
                                  itemBuilder: (context, index) => ProductCard2(controller.listSanPham[index])))
                          : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: ThemeConfig.defaultPaddingAll),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.listSanPham.length,
                                  itemBuilder: (context, index) => ProductCard3(controller.listSanPham[index]))),
                    ])),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
