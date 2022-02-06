import 'dart:async';

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
  late int _phuongThucThanhToan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _diaChi = DiaChi(
        khachHangId: Auth.khachHang.id!, tenNguoiNhan: Auth.khachHang.hoTen!, phone: Auth.khachHang.phone!, diaChiChiTiet: Auth.khachHang.diaChi!);
    _shippingMethod = ShippingMethod.courier();
    _phuongThucThanhToan = -1;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: Consumer<GioHangController>(
                  builder: (context, gioHangController, child) => Column(
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
                      gioHangController.buildListGioHang(),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ), // Set rounded corner radius
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: 75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    final value = await showModalBottomSheet<ShippingMethod>(
                                        context: context, builder: ((builder) => _ShippingMethodSheet(_shippingMethod.shipMethodRadio)));

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
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ), // Set rounded corner radius
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Choose Payment Method", style: TextStyle(fontWeight: FontWeight.bold)),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: const [Text("View more", style: TextStyle(fontWeight: FontWeight.bold)), Icon(Icons.arrow_right)],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 80,
                              //cho nay` xai` StreamBuilder de load cai ListView cho no giong cai RadioCheck
                              //ko biet xai` Radio nhu nao` nen tu che' no' thanh` Streambuilder
                              //xai` provider kem` FutureBuilder cung dc nhung ma` mat cong tao class,extend r Notifi...
                              child: StreamBuilder<int>(
                                  stream: _streamPhuongThucThanhToanController.stream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      print(snapshot.error);
                                    }
                                    if (snapshot.hasData) {
                                      _phuongThucThanhToan = snapshot.data!;
                                      return ListView.separated(
                                        //view nam` ngang
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        separatorBuilder: (context, _) => const SizedBox(
                                          width: 15, //khoang cach giua cac'layout
                                        ),
                                        itemBuilder: (context, index) => _PaymentMethod(index + 1, indexCheck: snapshot.data!),
                                      );
                                    }
                                    return ListView.separated(
                                      //view nam` ngang
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      separatorBuilder: (context, _) => const SizedBox(
                                        width: 15, //khoang cach giua cac'layout
                                      ),
                                      itemBuilder: (context, index) => _PaymentMethod(index + 1, indexCheck: -1),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      //cccccccccccccccccccccccccccccccccccccccccccccccccccccc
                      ListTile(
                        title: Text("Cash item: ${gioHangController.tongSoLuong} product"),
                        trailing: Text("${formatNumber.format(gioHangController.tongTien)} VNĐ"),
                      ),
                      ListTile(
                        title: const Text("Transportation cost"),
                        trailing: Text("${formatNumber.format(_shippingMethod.soTienShip)} VNĐ"),
                      ),
                      //const ListTile(title: Text("Voucher cost"), trailing: Text("0 VNĐ")),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
                            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black, offset: Offset(1, 3))] // Make rounded corner of border
                            ),
                        child: ListTile(
                          title: Text(
                            "Total: ${formatNumber.format(gioHangController.tongTien + _shippingMethod.soTienShip)}",
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          trailing: ElevatedButton(
                              onPressed: () async {
                                showCustomLoadding();

                                //neu' ko rong~ va` lap hoa don duoc
                                if (gioHangController.gioHang.isNotEmpty && await api_HoaDon_LapHoaDon(_diaChi.id ?? -1, _phuongThucThanhToan)) {
                                  Navigator.pushNamed(context, "/SuccessfullyPage");
                                  EasyLoading.dismiss();
                                } else {
                                  thongBaoScaffoldMessenger(context, "Sometime fails, check your cart or address");
                                  EasyLoading.dismiss();
                                }
                              },
                              child: const Text(
                                "Confirm & Pay",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  //side: const BorderSide(color: Colors.pink)
                                )),
                                backgroundColor: MaterialStateProperty.all(Colors.amber),
                              )),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                )),
          ]),
        ),
        //bottomNavigationBar: const BottomNavBar(0),
      ),
    );
  }
}

class _ShippingMethodSheet extends StatefulWidget {
  final _ShipMethodRadio ship;
  const _ShippingMethodSheet(this.ship, {Key? key}) : super(key: key);

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

class _ShippingMethodSheetState extends State<_ShippingMethodSheet> {
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

final _streamPhuongThucThanhToanController = StreamController<int>();

class _PaymentMethod extends StatefulWidget {
  const _PaymentMethod(this.index, {Key? key, required this.indexCheck}) : super(key: key);
  final int index;
  final int indexCheck;

  @override
  State<_PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<_PaymentMethod> {
  late String tieuDe;
  late Widget tieuDeWidget; //icon
  late String ghiChu;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //cai nay` la` phai lay tu bang? phuong thuc thanh toan' tu` sever tra? ve`
    //admin se co the tuy` chinh phuong thuc thanh toan' den' so tai khoan cua ho

    switch (widget.index) {
      case 2:
        tieuDe = "Credit Card";
        tieuDeWidget = const Icon(
          Icons.credit_card,
          color: Colors.blue,
        );
        ghiChu = "Chose to add $tieuDe";

        break;
      case 3:
        tieuDe = "MOMO";
        tieuDeWidget = const Icon(
          Icons.price_change,
          color: Colors.blue,
        );
        ghiChu = "Chose to add $tieuDe";

        break;
      case 4:
        tieuDe = "Viettel Pay";
        tieuDeWidget = const Icon(
          Icons.price_change,
          color: Colors.blue,
        );
        ghiChu = "Chose to add $tieuDe";

        break;
      case 5:
        tieuDe = "ZaloPay";
        tieuDeWidget = const Icon(
          Icons.price_change,
          color: Colors.blue,
        );
        ghiChu = "Chose to add $tieuDe";

        break;
      default:
        tieuDe = "Payment on delivery";
        tieuDeWidget = const Icon(
          Icons.price_change,
          color: Colors.blue,
        );
        ghiChu = tieuDe;
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color colorText = Colors.black;
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              side: BorderSide(color: widget.indexCheck == widget.index ? Colors.green : Colors.blue))),
          backgroundColor: widget.indexCheck == widget.index ? MaterialStateProperty.all(Colors.green[50]) : MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () async {
          print(widget.index);
          _streamPhuongThucThanhToanController.sink.add(widget.index);
        },
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    tieuDeWidget,
                    const SizedBox(width: 5),
                    Text(
                      tieuDe,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: colorText),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      ghiChu,
                      style: const TextStyle(fontStyle: FontStyle.italic, color: colorText),
                    ),
                    const SizedBox(width: 10),
                    //neu nhu dang chon o so nao` thi` chinh lai
                    (widget.indexCheck == widget.index)
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : const SizedBox(width: 10),
                  ],
                )
              ],
            )));
  }
}
