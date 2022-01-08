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

class BillingInfomationPageState extends State<BillingInfomationPage> {
  //cac bien' de dung`, de? tam
  late DiaChi _diaChi;
  late ShippingMethod _shippingMethod;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _diaChi = DiaChi(
        khachHangId: Auth.khachHang.id!, tenNguoiNhan: Auth.khachHang.hoTen!, phone: Auth.khachHang.phone!, diaChiChiTiet: Auth.khachHang.diaChi!);
    _shippingMethod = ShippingMethod.courier();
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
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                          //aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
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
                    const Divider(),
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
                                        width: MediaQuery.of(context).size.width,
                                        height: 125,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              width: 130,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "http://10.0.2.2:8000/storage/assets/images/product-image/" + snapshot.data![index].productImg,
                                                placeholder: (context, url) => const Center(
                                                  child: CircularProgressIndicator(),
                                                ),
                                                errorWidget: (context, url, error) => Container(
                                                  color: Colors.black12,
                                                ),
                                              ),
                                            ),
                                            //bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
                                            Expanded(
                                                child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  RichText(
                                                      text: TextSpan(
                                                          style: const TextStyle(color: Colors.black), text: snapshot.data![index].productName)),
                                                  Text(
                                                    snapshot.data![index].id.toString(),
                                                    style: const TextStyle(color: Colors.grey),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(formatNumber.format(snapshot.data![index].productPrice),
                                                          style: const TextStyle(fontWeight: FontWeight.bold)),
                                                      const Spacer(),
                                                      Text("Quantily: ${snapshot.data![index].quantity}",
                                                          style: const TextStyle(fontWeight: FontWeight.bold))
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
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ), // Set rounded corner radius
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(_shippingMethod.tenLoaiShip, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  const Icon(Icons.local_shipping_sharp, color: Colors.blue),
                                  const SizedBox(width: 10),
                                  Text(_shippingMethod.moTa),
                                ],
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      final value = await showModalBottomSheet<ShippingMethod>(
                                          context: context, builder: ((builder) => ShippingMethodSheet(_shippingMethod.shipMethodRadio)));

                                      setState(() => _shippingMethod = value!);
                                    },
                                    child: Row(
                                      children: [
                                        Text("${formatNumber.format(_shippingMethod.soTienShip)} VNĐ",
                                            style: const TextStyle(fontWeight: FontWeight.bold)),
                                        const Icon(Icons.arrow_right)
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    const Divider(),
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
                    //cccccccccccccccccccccccccccccccccccccccccccccccccccccc
                    ListTile(
                      title: const Text("Cash item: 00000 product"),
                      trailing: Text("${formatNumber.format(Provider.of<CartProvider>(context).getTotalPrice())} VNĐ"),
                    ),
                    ListTile(
                      title: const Text("Transportation cost"),
                      trailing: Text("${formatNumber.format(_shippingMethod.soTienShip)} VNĐ"),
                    ),
                    //const ListTile(title: Text("Voucher cost"), trailing: Text("0 VNĐ")),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                      alignment: Alignment.center,
                      decoration:
                          const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
                              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black, offset: Offset(1, 3))] // Make rounded corner of border
                              ),
                      child: ListTile(
                        title: Text(
                          "Total: ${formatNumber.format(Provider.of<CartProvider>(context).totalPrice + _shippingMethod.soTienShip)}",
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        trailing: ElevatedButton(
                            onPressed: () async {
                              showCustomLoadding();

                              if (await api_HoaDon_LapHoaDon(_diaChi.id ?? 1)) {
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
                    const Divider(),
                  ],
                )),
          ]),
        ),
        bottomNavigationBar: const BottomNavBar(0),
      ),
    );
  }
}

class ShippingMethodSheet extends StatefulWidget {
  final _ShipMethodRadio ship;
  const ShippingMethodSheet(this.ship, {Key? key}) : super(key: key);

  @override
  _ShippingMethodSheetState createState() => _ShippingMethodSheetState();
}

//enum mini cua ship
enum _ShipMethodRadio { fast, reguler, courier }

//modal mini ship
class ShippingMethod {
  late String tenLoaiShip;
  late String moTa;
  late double soTienShip;
  late _ShipMethodRadio shipMethodRadio;
  ShippingMethod({
    required this.tenLoaiShip,
    required this.moTa,
    required this.soTienShip,
    required this.shipMethodRadio,
  });
  ShippingMethod.fast() {
    tenLoaiShip = "Shipping fast";
    moTa = "1 days delivery";
    soTienShip = 22000;
    shipMethodRadio = _ShipMethodRadio.fast;
  }
  ShippingMethod.reguler() {
    tenLoaiShip = "Shipping reguler";
    moTa = "3-5 days delivery";
    soTienShip = 30000;
    shipMethodRadio = _ShipMethodRadio.reguler;
  }
  ShippingMethod.courier() {
    tenLoaiShip = "Shipping courier";
    moTa = "5-7 days delivery";
    soTienShip = 50000;
    shipMethodRadio = _ShipMethodRadio.courier;
  }
}

class _ShippingMethodSheetState extends State<ShippingMethodSheet> {
  @override
  Widget build(BuildContext context) {
    _ShipMethodRadio? _shipMethodddradio = widget.ship;

    Widget _radioShippingMethod(ShippingMethod _ship, _ShipMethodRadio _shipMethod) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ), // Set rounded corner radius
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 75,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_ship.tenLoaiShip, style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    const Icon(Icons.local_shipping_sharp, color: Colors.blue),
                    const SizedBox(width: 10),
                    Text(_ship.moTa),
                  ],
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${formatNumber.format(_ship.soTienShip)} VNĐ", style: const TextStyle(fontWeight: FontWeight.bold)),
                    Radio<_ShipMethodRadio>(
                        value: _shipMethod, groupValue: _shipMethodddradio, onChanged: (value) => Navigator.pop<ShippingMethod>(context, _ship))
                  ],
                ))
          ],
        ),
      );
    }

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Shipping Method', style: TextStyle(color: Colors.indigo))),
          actions: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.black54,
                  ),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              const Divider(),
              _radioShippingMethod(ShippingMethod.fast(), _ShipMethodRadio.fast),
              const Divider(),
              _radioShippingMethod(ShippingMethod.reguler(), _ShipMethodRadio.reguler),
              const Divider(),
              _radioShippingMethod(ShippingMethod.courier(), _ShipMethodRadio.courier),
            ],
          ),
        ),
      ),
    );
  }
}
