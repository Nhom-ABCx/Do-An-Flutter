import 'package:flutter/material.dart';
import 'package:flutter_application_1/Modals/tinh_thanhpho.dart';
import '/all_page.dart';

class TinhThanhPhoPage extends StatefulWidget {
  const TinhThanhPhoPage({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

//trang nay la layout de copy custom, ko co xai`
class _HomeState extends State<TinhThanhPhoPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(
            title: const Text(
              "Province / City",
              style: TextStyle(color: Colors.indigo),
            ),
          ),
          //Hide
          //drawer: const NavigationDrawer(),
          //Body
          body: FutureBuilder<List<TinhThanhPho>>(
              future: api_GetAll_TinhThanhPho(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // ignore: avoid_print
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                const Divider(),
                                ListTile(
                                  title: Text(
                                    snapshot.data![index].name!,
                                  ),
                                  tileColor: Colors.white,
                                  //khi click vao thi se tra ve Nguyen 1 tinh/ThanhPho de query ra phan`sau
                                  onTap: () => Navigator.pop<TinhThanhPho>(context, snapshot.data![index]),
                                ),
                              ],
                            ))
                    : const Center(child: Padding(padding: EdgeInsets.only(top: 250), child: CircularProgressIndicator()));
              }),
          //nho' thay doi? lai con so' truyen du~ lieu
          //bottomNavigationBar: const BottomNavBar(0),
        ),
      );
}
