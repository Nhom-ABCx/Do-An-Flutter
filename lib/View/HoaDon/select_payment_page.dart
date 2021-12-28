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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Choose Payment Method",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: 170,
                            height: 130,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "routeting");
                                    },
                                    icon: const Icon(
                                      Icons.credit_card,
                                      size: 50,
                                      color: Colors.blue,
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 25, top: 20),
                                  child: Text(
                                    "Credit Card",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: 170,
                            height: 130,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "routeting");
                                    },
                                    icon: const Icon(
                                      Icons.account_balance,
                                      size: 50,
                                      color: Colors.blue,
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 55, top: 20),
                                  child: Text(
                                    "Bank",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: 170,
                            height: 130,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "routeting");
                                    },
                                    icon: const Icon(
                                      Icons.payments,
                                      size: 50,
                                      color: Colors.blue,
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 47, top: 20),
                                  child: Text(
                                    "PayPal",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: 170,
                            height: 130,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "routeting");
                                    },
                                    icon: const Icon(
                                      Icons.price_change,
                                      size: 50,
                                      color: Colors.blue,
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(left: 55, top: 20),
                                  child: Text(
                                    "Cash",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
