import 'package:flutter/material.dart';
import 'home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          centerTitle: true,
          title: Text("Homeeeeeeeeeeeeeeeeeeeeee"),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverList(delegate: SliverChildListDelegate([])),
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
