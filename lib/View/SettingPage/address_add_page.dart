import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/View/SettingPage/phuong_xa_page.dart';
import 'package:flutter_application_1/View/SettingPage/quan_huyen_page.dart';
import 'package:flutter_application_1/View/SettingPage/tinh_thanhpho_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '/all_page.dart';

class AddressAddPage extends StatefulWidget {
  final DiaChi diaChi;
  const AddressAddPage(this.diaChi, {Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

//trang nay la layout de copy custom, ko co xai`
class _HomeState extends State<AddressAddPage> {
  late TextEditingController _txtFullname;
  late TextEditingController _txtPhone;
  late TextEditingController _txtAddress;
  late String _fullName;
  late String _phone;
  late TinhThanhPho _tinhThanhPho;
  late QuanHuyen _quanHuyen;
  late PhuongXa _phuongXa;
  late bool _daChonTinhThanhPho;
  late bool _daChonQuanHuyen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _daChonTinhThanhPho = false;
    _daChonQuanHuyen = false;

    if (widget.diaChi.tenNguoiNhan.isNotEmpty) {
      _fullName = widget.diaChi.tenNguoiNhan;
      _txtFullname = TextEditingController(text: widget.diaChi.tenNguoiNhan);
      _txtAddress = TextEditingController(text: widget.diaChi.diaChiChiTiet);
      _txtPhone = TextEditingController(text: widget.diaChi.phone);
      _phone = widget.diaChi.phone;
      _tinhThanhPho = TinhThanhPho(code: widget.diaChi.codeTinhThanhPho, name: widget.diaChi.tinhThanhPho);
      _quanHuyen = QuanHuyen(code: widget.diaChi.codeQuanHuyen, name: widget.diaChi.quanHuyen);
      _phuongXa = PhuongXa(code: widget.diaChi.codePhuongXa, name: widget.diaChi.phuongXa);
    } else {
      _fullName = "";
      _txtFullname = TextEditingController();
      _txtAddress = TextEditingController();
      _txtPhone = TextEditingController();
      _phone = "";
      _tinhThanhPho = TinhThanhPho();
      _quanHuyen = QuanHuyen();
      _phuongXa = PhuongXa();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _txtFullname.dispose();
    _txtAddress.dispose();
    _txtPhone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final diaChiController = Provider.of<DiaChiController>(context, listen: false);

    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //TopHeader
        appBar: AppBarPage(
          title: Text(
            widget.diaChi.tenNguoiNhan.isEmpty ? "Add new shipping address" : "Update shipping address",
            style: const TextStyle(color: Colors.indigo),
          ),
        ),
        //Hide
        //drawer: const NavigationDrawer(),
        //Body
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildListTitleSetting(
                  text: 'Full Name',
                  textCustoms: _fullName,
                  onClicked: () async {
                    //tao 1 bien nhan gia tri tu trang tiep theo gui ve`
                    final name = await openInputDialog(context, _txtFullname, "Input your full name", "Your name");
                    if (name!.isEmpty) return;
                    setState(() => _fullName = name);
                  }),
              //validate
              StreamBuilder(
                stream: diaChiController.tenNguoiNhan.stream,
                builder: (context, snapshot) => snapshot.hasError
                    ? Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: Colors.red, fontSize: 15),
                      )
                    : const SizedBox(),
              ),
              buildListTitleSetting(
                  text: 'Phone',
                  textCustoms: _phone,
                  onClicked: () async {
                    //tao 1 bien nhan gia tri tu trang tiep theo gui ve`
                    final phone = await openInputDialog(context, _txtPhone, "Input your phone number", "Your phone", true);
                    if (phone!.isEmpty) return;
                    setState(() => _phone = phone);
                  }),
              //validate
              StreamBuilder(
                stream: diaChiController.phone.stream,
                builder: (context, snapshot) => snapshot.hasError
                    ? Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: Colors.red, fontSize: 15),
                      )
                    : const SizedBox(),
              ),
              buildListTitleSetting(
                  text: 'Province / City',
                  textCustoms: _tinhThanhPho.name ?? "",
                  onClicked: () async {
                    //tao 1 bien nhan gia tri tu trang tiep theo gui ve`
                    final value = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TinhThanhPhoPage(),
                        ));
                    // ignore: unnecessary_null_comparison
                    if (value == null) return;
                    //gan no lai gia tri
                    //neu vua chon 1 tinh? moi thi reset lai quan huyen phuong` va` xa~
                    setState(() {
                      _tinhThanhPho = value;
                      _quanHuyen = QuanHuyen();
                      _phuongXa = PhuongXa();
                      _daChonTinhThanhPho = true;
                      _daChonQuanHuyen = false;
                    });
                  }),
              buildListTitleSetting(
                  text: 'District',
                  textCustoms: _quanHuyen.name ?? "",
                  onClicked: () async {
                    if (_daChonTinhThanhPho) {
                      //tao 1 bien nhan gia tri tu trang tiep theo gui ve`
                      final value = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuanHuyenPage(_tinhThanhPho.code!),
                          ));
                      // ignore: unnecessary_null_comparison
                      if (value == null) return;
                      //gan no lai gia tri
                      setState(() {
                        _quanHuyen = value;
                        _phuongXa = PhuongXa();
                        _daChonQuanHuyen = true;
                      });
                    }
                  }),
              buildListTitleSetting(
                  text: 'Ward',
                  textCustoms: _phuongXa.name ?? "",
                  onClicked: () async {
                    if (_daChonQuanHuyen) {
                      //tao 1 bien nhan gia tri tu trang tiep theo gui ve`
                      final value = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhuongXaPage(_quanHuyen.code!),
                          ));
                      // ignore: unnecessary_null_comparison
                      if (value == null) return;
                      //gan no lai gia tri
                      setState(() => _phuongXa = value);
                    }
                  }),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.local_shipping,
                          color: Colors.indigo,
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text("Specific address", style: TextStyle(color: Colors.black, fontSize: 15)),
                        )
                      ],
                    ),
                    TextFormField(
                      controller: _txtAddress, //gan gia tri cua text vao bien'
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Apartment number, Street...',
                      ),
                    ),
                    //validate
                    StreamBuilder(
                      stream: diaChiController.diaChiCHiTiet.stream,
                      builder: (context, snapshot) => snapshot.hasError
                          ? Text(
                              snapshot.error.toString(),
                              style: const TextStyle(color: Colors.red, fontSize: 15),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: SizedBox(
                  //tu dong canh le`tu thiet bi
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      showCustomLoadding();

                      final _diaChi = DiaChi(
                          khachHangId: Auth.khachHang.id!,
                          tenNguoiNhan: _fullName,
                          phone: _phone,
                          tinhThanhPho: _tinhThanhPho.name,
                          quanHuyen: _quanHuyen.name,
                          phuongXa: _phuongXa.name,
                          diaChiChiTiet: _txtAddress.text,
                          codeTinhThanhPho: _tinhThanhPho.code,
                          codeQuanHuyen: _quanHuyen.code,
                          codePhuongXa: _phuongXa.code);
                      //neu nhu co truyen vao diaChi thi se cap nhat chu ko tao cai moi'
                      if (widget.diaChi.id! > 0) {
                        final success = await diaChiController.updateData(context, _diaChi, widget.diaChi.id!);
                        if (success) {
                          thongBaoScaffoldMessenger(context, "Update Success");
                          Navigator.pop(context);
                          EasyLoading.dismiss();
                        } else {
                          (thongBaoScaffoldMessenger(context, "Fails update"));
                          (context as Element).reassemble();
                          EasyLoading.dismiss();
                        }
                      } else {
                        final success = await diaChiController.addData(context, _diaChi);
                        if (success) {
                          thongBaoScaffoldMessenger(context, "Add Success");
                          Navigator.pop(context);
                          EasyLoading.dismiss();
                        } else {
                          (thongBaoScaffoldMessenger(context, "Fails add"));
                          (context as Element).reassemble();
                          EasyLoading.dismiss();
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.add_location_alt,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        //side: const BorderSide(color: Colors.pink)
                      )),
                      //backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //nho' thay doi? lai con so' truyen du~ lieu
        bottomNavigationBar: const BottomNavBar(0),
      ),
    );
  }
}

Future<String?> openInputDialog(BuildContext context, TextEditingController txtColtroller, title, String labelText,
        [bool? inputNumberOnly = false]) =>
    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: TextFormField(
                  autofocus: true,
                  controller: txtColtroller, //gan gia tri cua text vao bien'
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: labelText,
                  ),
                  inputFormatters: inputNumberOnly!
                      ? <TextInputFormatter>[
                          //only number
                          FilteringTextInputFormatter.digitsOnly
                        ]
                      : null,
                  keyboardType: inputNumberOnly ? TextInputType.phone : null),
              actions: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(txtColtroller.text),
                    child: const Text("Submit"),
                  ),
                )
              ],
            ));
