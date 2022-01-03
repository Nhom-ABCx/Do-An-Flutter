import 'package:flutter/material.dart';
import 'package:flutter_application_1/Modals/quan_huyen.dart';
import '/all_page.dart';

class QuanHuyenPage extends StatefulWidget {
  final int _code;
  const QuanHuyenPage(this._code,{Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

//trang nay la layout de copy custom, ko co xai`
class _HomeState extends State<QuanHuyenPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        //huy keyboard khi bam ngoai man hinh
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          //TopHeader
          appBar: AppBarPage(
            title: const Text(
              "District",
              style: TextStyle(color: Colors.indigo),
            ),
          ),
          //Hide
          //drawer: const NavigationDrawer(),
          //Body
          body: FutureBuilder<List<QuanHuyen>>(
              future: api_GetAll_QuanHuyen(widget._code),
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
                                  onTap: () => Navigator.pop<QuanHuyen>(context, snapshot.data![index]),
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
