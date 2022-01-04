import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
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
  late DiaChi _diaChi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _diaChi = DiaChi(
        khachHangId: Auth.khachHang.id!, tenNguoiNhan: Auth.khachHang.hoTen!, phone: Auth.khachHang.phone!, diaChiChiTiet: Auth.khachHang.diaChi!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartprd = Provider.of<CartProvider>(context);

    return GestureDetector(
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
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blue[100],
              child: ListTile(
                leading: const Icon(Icons.message_outlined, color: Colors.blue),
                title: RichText(
                    text: const TextSpan(
                        //style: DefaultTextStyle.of(context).style,
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        text:
                            "Orders are likely to be shipped outside of business hours or on weekends to reach you as soon as possible. If possible, please choose to deliver at your home address to ensure successful delivery")),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ), // Set rounded corner radius

              child: Column(
                children: [
                  Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.indigo,
                          size: 30,
                        ),
                        //ten khach hang nhan
                        Text(
                          _diaChi.tenNguoiNhan,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        // so dien thoai
                        Text(_diaChi.phone, style: const TextStyle(color: Colors.grey, fontSize: 15)),
                      ],
                    ), //so big text
                    alignment: FractionalOffset.topLeft,
                  ),
                  const Divider(
                    color: Colors.indigo,
                  ),
                  Align(
                    //dia chi
                    child: Text((_diaChi.phuongXa ?? "") + ", " + (_diaChi.quanHuyen ?? "") + ", " + (_diaChi.tinhThanhPho ?? "")),
                    alignment: FractionalOffset.topLeft,
                  ),
                  const Divider(
                    color: Colors.indigo,
                  ),
                  Align(
                    child: Text(_diaChi.diaChiChiTiet),
                    alignment: FractionalOffset.topLeft,
                  ),
                  const Divider(
                    color: Colors.indigo,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          //tao 1 bien nhan gia tri tu trang tiep theo gui ve`
                          final value = await Navigator.push<DiaChi>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddressPage(),
                              ));
                          if (value == null) return;
                          //xu ly gan' lai gia tri
                          setState(() => _diaChi = value);
                        },
                        icon: const Icon(
                          Icons.change_circle,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Change',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            //side: const BorderSide(color: Colors.pink)
                          )),
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            //----------------sanPham
            FutureBuilder<List<Cart>>(
                future: cartprd.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  return snapshot.hasData
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                ), // Set rounded corner radius
                                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                width: MediaQuery.of(context).size.width,
                                height: 125,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 130,
                                      child: CachedNetworkImage(
                                        imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/" + snapshot.data![index].productImg,
                                        placeholder: (context, url) => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) => Container(
                                          color: Colors.black12,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          RichText(
                                              text: TextSpan(style: const TextStyle(color: Colors.black), text: snapshot.data![index].productName)),
                                          Text(
                                            snapshot.data![index].id.toString(),
                                            style: const TextStyle(color: Colors.grey),
                                          ),
                                          Row(
                                            children: [
                                              Text(snapshot.data![index].productPrice.toString(),
                                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                                              const Spacer(),
                                              Text("Quantily: ${snapshot.data![index].quantity}", style: const TextStyle(fontWeight: FontWeight.bold))
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                              const Divider()
                            ],
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                }),
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
                      decoration:
                          const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
                              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black, offset: Offset(1, 3))] // Make rounded corner of border
                              ),
                      child: ListTile(
                        title: Text(
                          Provider.of<CartProvider>(context).getTotalPrice().toString(),
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
}
