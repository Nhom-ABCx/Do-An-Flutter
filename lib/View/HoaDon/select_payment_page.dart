import 'package:flutter/material.dart';
import '/all_page.dart';

class SelectPaymentPage extends StatefulWidget {
  const SelectPaymentPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SelectPaymentPageState();
}

class SelectPaymentPageState extends State<SelectPaymentPage> {
  //cac bien' de dung`, de? tam
  ShipMethod _shipMethod = ShipMethod.fast;

  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(
            title: const Text(
              "Select Payment",
              style: TextStyle(color: Colors.black),
            ),
          ),
          // //Hide
          // drawer: const NavigationDrawer(),
          //Body
          body: SingleChildScrollView(
            child: Align(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.white.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // surffix isn't working properly  with SVG
                              // thats why we use row
                              // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                            ),
                          ),
                        ),
                        const Icon(Icons.search),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
