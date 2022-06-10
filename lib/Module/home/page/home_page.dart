part of 'container_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final a = controller;
    return CustomScrollView(
      slivers: [
        _buildAppBar(context),
        SliverToBoxAdapter(
            child: FutureBuilder<List<HinhAnh>?>(
          future: controller.getBanner(),
          builder: (context, snapshot) {
            {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? (controller.listBanner.isEmpty)
                      ? const SizedBox() //show emty widget
                      : HomeWidgetBanner(controller.listBanner)
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }
          },
        )),
        _buildCategory(),
        _buildFlashSale(),
        _buildRecent(),
        _buildNewProduct(),
      ],
    );
  }

  SliverPadding _buildNewProduct() {
    return SliverPadding(
      padding: const EdgeInsets.all(ThemeConfig.defaultPaddingAll),
      sliver: SliverList(
          delegate: SliverChildListDelegate([
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New product",
              style: Get.textTheme.headlineSmall,
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Icon(Icons.navigate_next),
              icon: const Text("View more"),
            )
          ],
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //crossAxisSpacing: 0,
              //mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) => const ProductCard2()),
        const ProductCard3(),
        const ProductCard2(useStyle2: true),
      ])),
    );
  }

  SliverPadding _buildRecent() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(ThemeConfig.defaultPaddingAll, 0, ThemeConfig.defaultPaddingAll, 0),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent",
                      style: Get.textTheme.headlineSmall,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: const Icon(Icons.navigate_next),
                      icon: const Text("View more"),
                    )
                  ],
                )),
            // SizedBox(
            //   height: 230,
            //   child: controller.obx((state) => ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: state.length,
            //         itemBuilder: (context, index) => ProductCard1(sanPham: state[index]),
            //       )),
            // )
            SizedBox(
              height: 230,
              child: FutureBuilder<List<SanPham>?>(
                future: controller.getListSanPham(),
                builder: (context, snapshot) {
                  {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }
                    return snapshot.hasData
                        ? (controller.listSanPham.isEmpty)
                            ? const SizedBox() //show emty widget
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.listSanPham.length,
                                itemBuilder: (context, index) => ProductCard1(sanPham: controller.listSanPham[index]),
                              )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding _buildFlashSale() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(ThemeConfig.defaultPaddingAll, 0, ThemeConfig.defaultPaddingAll, 0),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Flash sale",
                      style: Get.textTheme.headlineSmall,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: const Icon(Icons.navigate_next),
                      icon: const Text("View more"),
                    )
                  ],
                )),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, _) => const SizedBox(width: 0),
                itemBuilder: (context, index) => const ProductCard2(),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverPadding _buildCategory() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(ThemeConfig.defaultPaddingAll, 0, ThemeConfig.defaultPaddingAll, 0),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: Get.textTheme.headlineSmall,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: const Icon(Icons.navigate_next),
                      icon: const Text("View more"),
                    )
                  ],
                )),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => const CategoryCard1(newItemCount: 2),
              ),
            )
          ],
        ),
      ),
    );
  }
//cái hình nền user
  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      //automaticallyImplyLeading: false,
      centerTitle: true,
      expandedHeight: 150,
      floating: true, //giuu lau bottom
      pinned: true, //giuu lai bottom
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: ThemeConfig.defaultPaddingAll),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://i0.wp.com/www.printmag.com/wp-content/uploads/2021/02/4cbe8d_f1ed2800a49649848102c68fc5a66e53mv2.gif?fit=476%2C280&ssl=1"),
          ),
        ),
      ],
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
        //collapseMode: CollapseMode.parallax,
        background: Padding(
          padding: EdgeInsets.only(left: ThemeConfig.defaultPaddingAll),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Find your favorite product', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
        ),
      ),
      bottom: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: Colors.grey[100],
          ),
          //width: double.infinity,
          //height: 40,
          child: TextField(
            readOnly: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
            onTap: () async {
              final result = await showSearch<String>(context: context, delegate: SearchPage(data: lstString));
              print(result);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, ThemeConfig.defaultPaddingAll, 5),
            child: ElevatedButton(onPressed: () {}, child: const Icon(Icons.tune)),
          )
        ],
      ),
    );
  }
}
