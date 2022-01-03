import 'package:flutter/material.dart';
import '/all_page.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

//trang nay la layout de copy custom, ko co xai`
class _HomeState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(
            title: const Text(
              "Select shipping address",
              style: TextStyle(color: Colors.indigo),
            ),
          ),
          //Hide
          //drawer: const NavigationDrawer(),
          //Body
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: TextButton(
                        onPressed: () => Navigator.pushNamed(context, "/AddressAddPage"),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.add),
                            Text(
                              "Add new to Shipping Address",
                              style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0), side: const BorderSide(color: Colors.indigo))),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListTile(
                    leading: const Icon(
                      Icons.location_on,
                      color: Colors.indigo,
                    ),
                    title: Row(
                      children: const [
                        Text(
                          "Tên khách hàng",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 15),
                        Text("09123123", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    subtitle: const Text("ABC/123/XYZ Đường ABC, Ấp 1,thành phố HCM"),
                    isThreeLine: true,
                    trailing: TextButton(
                      child: const Text("Edit", style: TextStyle(color: Colors.blue)),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
          //nho' thay doi? lai con so' truyen du~ lieu
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
