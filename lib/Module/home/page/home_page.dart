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
                backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/3.jpg"),
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
                //readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onTap: () {},
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
        SliverToBoxAdapter(
          child: BannerWidget(),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(ThemeConfig.defaultPaddingAll, ThemeConfig.defaultPaddingAll, ThemeConfig.defaultPaddingAll, 0),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => ItemCategoryWidget(newItemCount: 2),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(ThemeConfig.defaultPaddingAll),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //crossAxisSpacing: 0,
                  //mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) => const ItemProductWidget()),
          ])),
        ),
      ],
    );
  }
}
