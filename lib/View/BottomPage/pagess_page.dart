import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/SettingPage/address_add_page.dart';
import '/all_page.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);
  @override
  _PagesState createState() => _PagesState();
}

//trang nay la layout de copy custom, ko co xai`
class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //huy keyboard khi bam ngoai man hinh
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        //TopHeader
        appBar: AppBarPage(
            title: const Text(
          "All page",
          style: TextStyle(color: Colors.black),
        )),
        //Hide
        //drawer: const NavigationDrawer(),
        //Body
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              buildListTitleSetting(
                text: 'Billing Information',
                textCustoms: '',
                onClicked: () => Navigator.pushNamed(context, "/BillingPage"),
              ),
              buildListTitleSetting(
                text: 'Select Payment',
                textCustoms: '',
                onClicked: () => Navigator.pushNamed(context, "/SelectPaymentPage"),
              ),
              buildListTitleSetting(
                text: 'Forgot Password Susses',
                textCustoms: '',
                onClicked: () => Navigator.pushNamed(context, "/Forgot_action"),
              ),
              buildListTitleSetting(
                text: 'Successfully Page',
                textCustoms: '',
                onClicked: () => Navigator.pushNamed(context, "/SuccessfullyPage"),
              ),
              buildListTitleSetting(
                text: 'Quan Ly Don Hang Page',
                textCustoms: '',
                onClicked: () => Navigator.pushNamed(context, "/QuanLyDonHangPage"),
              ),
              buildListTitleSetting(
                text: 'My Wishlist',
                textCustoms: '',
                onClicked: () => Navigator.pushNamed(context, "/MyWishlist"),
              ),
              buildListTitleSetting(
                text: 'Shipping Address',
                textCustoms: '',
                onClicked: () => Navigator.pushNamed(context, "/AddressPage"),
              ),
              buildListTitleSetting(
                text: 'Address Add Page',
                textCustoms: '',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AddressAddPage(
                      DiaChi.empty(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //nho' thay doi? lai con so' truyen du~ lieu
        bottomNavigationBar: const BottomNavBar(4),
      ),
    );
  }
}
