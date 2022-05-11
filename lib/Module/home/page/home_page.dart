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
          expandedHeight: 200,
          floating: true, //giuu lau bottom
          pinned: true, //giuu lai bottom
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: ThemeConfig.defaultPaddingAll),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/22.jpg"),
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
                child: Text('Find your favorite product', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
              ),
            ),
          ),
          bottom: AppBar(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: Colors.grey[100],
              ),
              //width: double.infinity,
              //height: 40,
              child: Center(
                child: TextField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Tìm kiếm sản phẩm',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
            ListView.builder(
              shrinkWrap: true, //tranh' loi~ view SingleChildScrollView-column
              //ngan chan ListView no' cuon xuong' duoc, xai` cho SingleChildScrollView-column
              physics: const NeverScrollableScrollPhysics(),
              //scrollDirection: Axis.horizontal,
              itemCount: 100,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  child: Card(
                    color: Colors.green[100],
                    shadowColor: Colors.blueGrey, //mau` do bong'
                    elevation: 10, //do noi?
                    child: Text('data'),
                  ),
                );
              },
            ),
          ])),
        ),
        // giuu lai de xem
        // SliverToBoxAdapter(
        //   child: Container(
        //     height: 100.0,
        //     child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: 10,
        //       itemBuilder: (context, index) {
        //         return Container(
        //           width: 150.0,
        //           child: Card(
        //             color: Colors.green[100],
        //             shadowColor: Colors.blueGrey, //mau` do bong'
        //             elevation: 10, //do noi?
        //             child: Text('data'),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
