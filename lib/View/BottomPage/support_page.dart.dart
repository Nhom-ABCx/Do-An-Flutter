import 'package:flutter/material.dart';
import '/all_page.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SupportPageState();
}

class SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(),
          //Hide
          drawer: const NavigationDrawer(),
          //Body
          body: const Center(
            child: Text("Trang SUPPORT ne"),
          ),
          bottomNavigationBar: const BottomNavBar(1),
        ),
      );
}
