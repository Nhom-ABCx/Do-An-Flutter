import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Modals/phuong_xa.dart';
import 'package:flutter_application_1/Modals/quan_huyen.dart';
import 'package:flutter_application_1/Modals/tinh_thanhpho.dart';
import 'package:flutter_application_1/View/SettingPage/phuong_xa_page.dart';
import 'package:flutter_application_1/View/SettingPage/quan_huyen_page.dart';
import 'package:flutter_application_1/View/SettingPage/tinh_thanhpho_page.dart';
import '/all_page.dart';

class AddressAddPage extends StatefulWidget {
  const AddressAddPage({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

//trang nay la layout de copy custom, ko co xai`
class _HomeState extends State<AddressAddPage> {
  late TextEditingController _txtFullname;
  late TextEditingController _txtPhone;
  late TextEditingController _txtAddress;
  String _fullName = "";
  String _phone = "";
  late TinhThanhPho _tinhThanhPho;
  late QuanHuyen _quanHuyen;
  late PhuongXa _phuongXa;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _txtFullname = TextEditingController();
    _txtAddress = TextEditingController();
    _txtPhone = TextEditingController();
    _tinhThanhPho = TinhThanhPho();
    _quanHuyen = QuanHuyen();
    _phuongXa = PhuongXa();
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
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(
            title: const Text(
              "Add new shipping address",
              style: TextStyle(color: Colors.indigo),
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
                      final name = await openInputDialog(_txtFullname, "Input your full name", "Your name");
                      if (name!.isEmpty) return;
                      setState(() => _fullName = name);
                    }),
                buildListTitleSetting(
                    text: 'Phone',
                    textCustoms: _phone,
                    onClicked: () async {
                      //tao 1 bien nhan gia tri tu trang tiep theo gui ve`
                      final phone = await openInputDialog(_txtPhone, "Input your phone number", "Your phone", true);
                      if (phone!.isEmpty) return;
                      setState(() => this._phone = phone);
                    }),
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
                      });
                    }),
                buildListTitleSetting(
                    text: 'District',
                    textCustoms: _quanHuyen.name ?? "",
                    onClicked: () async {
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
                      });
                    }),
                buildListTitleSetting(
                    text: 'Ward',
                    textCustoms: _phuongXa.name ?? "",
                    onClicked: () async {
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
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: SizedBox(
                    //tu dong canh le`tu thiet bi
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton.icon(
                      onPressed: () {},
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

  Future<String?> openInputDialog(TextEditingController txtColtroller, title, String labelText, [bool? inputNumberOnly = false]) =>
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
}
