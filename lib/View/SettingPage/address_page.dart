import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/SettingPage/address_add_page.dart';
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
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => AddressAddPage(DiaChi.empty()),
                              ),
                            ),
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
                FutureBuilder<List<DiaChi>>(
                    future: api_GetAll_DiaChi(Auth.khachHang.id!),
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
                              itemBuilder: (context, index) => ListTile(
                                    leading: const Icon(
                                      Icons.location_on,
                                      color: Colors.indigo,
                                    ),
                                    title: Row(
                                      children: [
                                        Text(
                                          snapshot.data![index].tenNguoiNhan,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(width: 15),
                                        Text(snapshot.data![index].phone, style: const TextStyle(color: Colors.grey))
                                      ],
                                    ),
                                    subtitle: Text(snapshot.data![index].diaChiChiTiet +
                                        ", " +
                                        (snapshot.data![index].phuongXa ?? "") +
                                        ", " +
                                        (snapshot.data![index].quanHuyen ?? "") +
                                        ", " +
                                        (snapshot.data![index].tinhThanhPho ?? "")),
                                    isThreeLine: true,
                                    trailing: TextButton(
                                      child: const Text("Edit", style: TextStyle(color: Colors.blue)),
                                      onPressed: () {
                                        //Todo
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) => AddressAddPage(
                                              snapshot.data![index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ))
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    })
              ],
            ),
          ),
          //nho' thay doi? lai con so' truyen du~ lieu
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
