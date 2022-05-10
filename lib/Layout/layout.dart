import 'package:flutter/material.dart';

class LayOutPage extends StatefulWidget {
  const LayOutPage({Key? key}) : super(key: key);
  @override
  State<LayOutPage> createState() => _LayOutPageState();
}

class _LayOutPageState extends State<LayOutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //Hide
        //drawer: const NavigationDrawer(),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              centerTitle: true,
              title: Text("AAAAAAAa"),
            ),
            SliverList(delegate: SliverChildListDelegate([])),
          ],
        ),
      ),
    ));
  }
}
