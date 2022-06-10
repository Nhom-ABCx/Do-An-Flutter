// ignore_for_file: unused_field

part of 'container_page.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            indicatorWeight: 5,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            labelStyle: Theme.of(context).textTheme.titleMedium,
            tabs: [
              Tab(
                text: StringConstant.AllOrder.tr,
                icon: const Icon(Icons.new_label_rounded),
              ),
              Tab(text: StringConstant.Pending.tr, icon: const Icon(Icons.local_shipping_rounded)),
              Tab(text: StringConstant.ToReceive.tr, icon: const Icon(Icons.verified_rounded)),
              Tab(text: StringConstant.ToReview.tr, icon: const Icon(Icons.rate_review_rounded)),
              Tab(text: StringConstant.Canceled.tr, icon: const Icon(Icons.settings_backup_restore)),
            ],
          ),
          centerTitle: true,
          title: Text(
            StringConstant.HistoryOrder.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Tất cả"),
            ),
            Center(
              child: Text("Chờ giao"),
            ),
            Center(
              child: Text("Đã giao"),
            ),
            Center(
              child: Text("Chờ đánh giá"),
            ),
            Center(
              child: Text("Đã huỷ"),
            ),
          ],
        ),
      ),
    );
  }
}
