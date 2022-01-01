import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '/all_page.dart';

class BillingInfomationPage extends StatefulWidget {
  const BillingInfomationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BillingInfomationPageState();
}

enum ShipMethod { fast, reguler, courier }

class BillingInfomationPageState extends State<BillingInfomationPage> {
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
              "Billing Information",
              style: TextStyle(color: Colors.black),
            ),
          ),
          // //Hide
          // drawer: const NavigationDrawer(),
          //Body
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        height: 75,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)) // Set rounded corner radius
                            ),
                        child: const Text(
                          "Billing Information",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(children: [
                            buildTextMyProfile(icon: Icons.contact_page, title: 'Full Name', lable: Auth.khachHang.hoTen!),
                            buildTextMyProfile(icon: Icons.email, title: 'Email Address', lable: Auth.khachHang.email),
                            buildTextMyProfile(icon: Icons.phone, title: 'Phone', lable: '+' + Auth.khachHang.phone!),
                            buildTextMyProfile(icon: Icons.gps_fixed, title: 'Address', lable: Auth.khachHang.diaChi!),
                            SizedBox(
                              //tu dong canh le`tu thiet bi
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton.icon(
                                onPressed: () => Navigator.pushNamed(context, '/EditMyProfile'),
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Edit Billing Information',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        height: 75,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)) // Set rounded corner radius
                            ),
                        child: const Text(
                          "Shipping Method Choose",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            children: [
                              RadioListTile(
                                  activeColor: Colors.red,
                                  value: ShipMethod.fast,
                                  groupValue: _shipMethod,
                                  onChanged: (ShipMethod? value) {
                                    setState(() {
                                      _shipMethod = value!;
                                    });
                                  },
                                  title: const Text("Fast Shipping"),
                                  subtitle: const Text("1 days delivary for 1.0")),
                              RadioListTile(
                                  activeColor: Colors.orangeAccent,
                                  value: ShipMethod.reguler,
                                  groupValue: _shipMethod,
                                  onChanged: (ShipMethod? value) {
                                    setState(() {
                                      _shipMethod = value!;
                                    });
                                  },
                                  title: const Text("Reguler"),
                                  subtitle: const Text("3-7 days delivary for 0.4")),
                              RadioListTile(
                                activeColor: Colors.green,
                                value: ShipMethod.courier,
                                groupValue: _shipMethod,
                                onChanged: (ShipMethod? value) {
                                  setState(() {
                                    _shipMethod = value!;
                                  });
                                },
                                title: const Text("Courier"),
                                subtitle: const Text("5-8 days delivary for 0.3"),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        height: 75,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)) // Set rounded corner radius
                            ),
                        child: const Text(
                          "Choose Payment Method",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    width: 160,
                                    height: 100,
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
                                          padding: EdgeInsets.only(left: 27, top: 20),
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
                                    width: 160,
                                    height: 100,
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
                                          padding: EdgeInsets.only(left: 60, top: 20),
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
                                    width: 160,
                                    height: 100,
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
                                          padding: EdgeInsets.only(left: 50, top: 20),
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
                                    width: 160,
                                    height: 100,
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
                                          padding: EdgeInsets.only(left: 60, top: 20),
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
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
                            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black, offset: Offset(1, 3))] // Make rounded corner of border
                            ),
                        child: ListTile(
                          title: const Text(
                            "570.000đ",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          trailing: ElevatedButton(
                              onPressed: () async {
                                showCustomLoadding();

                                if (await api_HoaDon_LapHoaDon(Auth.khachHang.id!)) {
                                  Navigator.pushNamed(context, "/SuccessfullyPage");
                                  EasyLoading.dismiss();
                                } else {
                                  thongBaoScaffoldMessenger(context, "Sometime fails, check your my cart");
                                  EasyLoading.dismiss();
                                }
                              },
                              child: const Text(
                                "Confirm & Pay",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  //side: const BorderSide(color: Colors.pink)
                                )),
                                backgroundColor: MaterialStateProperty.all(Colors.amber),
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ))
            ]),
          ),
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
