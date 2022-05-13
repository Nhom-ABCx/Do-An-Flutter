part of 'container_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
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
        ),
        const SliverToBoxAdapter(child: BannerWidget()),
        SliverPadding(
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
                    itemBuilder: (context, index) => const ItemCategoryWidget(newItemCount: 2),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverPadding(
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
                    itemBuilder: (context, index) => const ItemProductWidget(),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverPadding(
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
                itemBuilder: (context, index) => const ItemProductWidget()),
            const ItemProduct2Widget(),
            Row(
              children: [
                _buildItem(context),
              ],
            ),
          ])),
        ),
      ],
    );
  }
}

Widget _buildItem(BuildContext context) {
  return SizedBox(
    width: 200,
    child: Stack(
      children: [
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: imageNetwork("https://cdn.tgdd.vn/Products/Images/42/247364/samsung-galaxy-m53-nau-thumb-600x600.jpg",
                      useBaseUrl: false, width: 150),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Backless Silver"),
                      RatingBarIndicator(
                          rating: 4.5,
                          itemSize: 20.0,
                          itemBuilder: (context, index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.amber,
                            );
                          }),
                      const SizedBox(
                        width: 100,
                        child: Divider(color: Colors.black),
                      ),
                      const Text(
                        "30",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.red,
              )),
        ),
      ],
    ),
  );
}
