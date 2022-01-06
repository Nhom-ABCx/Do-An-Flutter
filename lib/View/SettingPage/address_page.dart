import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/SettingPage/address_add_page.dart';
import 'package:provider/provider.dart';
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
                Consumer<DiaChiController>(
                    builder: (context, diaChiController, child) => FutureBuilder<List<DiaChi>>(
                        future: diaChiController.getData(),
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
                                  itemBuilder: (context, index) => Container(
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
                                              Text(
                                                snapshot.data![index].tenNguoiNhan,
                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                              ),
                                              Text(snapshot.data![index].phone, style: const TextStyle(color: Colors.grey, fontSize: 15)),
                                            ],
                                          ), //so big text
                                          alignment: FractionalOffset.topLeft,
                                        ),
                                        const Divider(
                                          color: Colors.indigo,
                                        ),
                                        Align(
                                          child: Text((snapshot.data![index].phuongXa ?? "") +
                                              ", " +
                                              (snapshot.data![index].quanHuyen ?? "") +
                                              ", " +
                                              (snapshot.data![index].tinhThanhPho ?? "")),
                                          alignment: FractionalOffset.topLeft,
                                        ),
                                        const Divider(
                                          color: Colors.indigo,
                                        ),
                                        Align(
                                          child: Text(snapshot.data![index].diaChiChiTiet),
                                          alignment: FractionalOffset.topLeft,
                                        ),
                                        const Divider(
                                          color: Colors.indigo,
                                        ),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton.icon(
                                              onPressed: () => Navigator.pop<DiaChi>(context, snapshot.data![index]),
                                              icon: const Icon(
                                                Icons.beenhere,
                                                color: Colors.white,
                                              ),
                                              label: const Text(
                                                'Select',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                              style: ButtonStyle(
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  //side: const BorderSide(color: Colors.pink)
                                                )),
                                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                                              ),
                                            ),
                                            //aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                                            ElevatedButton.icon(
                                              onPressed: () async {
                                                Provider.of<DiaChiController>(context, listen: false).deleteData(context, snapshot.data![index]);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                              ),
                                              label: const Text(
                                                'Delete',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                              style: ButtonStyle(
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  //side: const BorderSide(color: Colors.pink)
                                                )),
                                                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                                              ),
                                            ),
                                            //aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                                            ElevatedButton.icon(
                                              onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder: (BuildContext context) => AddressAddPage(
                                                    snapshot.data![index],
                                                  ),
                                                ),
                                              ),
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              ),
                                              label: const Text(
                                                'Edit',
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
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                );
                        }))
              ],
            ),
          ),
          //nho' thay doi? lai con so' truyen du~ lieu
          bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
