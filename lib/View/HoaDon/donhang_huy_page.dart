import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/all_page.dart';

class DonHangHuyPage extends StatefulWidget {
  const DonHangHuyPage({Key? key}) : super(key: key);
  @override
  _DonHangHuyPageState createState() => _DonHangHuyPageState();
}

//trang nay la layout de copy custom, ko co xai`
class _DonHangHuyPageState extends State<DonHangHuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TopHeader
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.indigo),
        title: const Text(
          "Cancel orders",
          style: TextStyle(color: Colors.indigo),
        ),
        centerTitle: true,
      ),
      //Hide
      //drawer: const NavigationDrawer(),
      //Body
      body: Consumer<QuanLyHoaDonController>(
          builder: (context, quanLyHoaDonController, child) => FutureBuilder<List<HoaDon>>(
              future: quanLyHoaDonController.getHoaDonHuy(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return khongCoGiHet(context, "There are no orders place yet.", "assets/icons/idea.svg");
                  }
                  return ListView.separated(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) => const Divider(height: 5),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
                          ), // Set rounded corner radius
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 30,
                                ),
                                title: Text("Code: ${snapshot.data![index].id}"),
                                trailing: TextButton(
                                    onPressed: () => quanLyHoaDonController.restoreData(context, snapshot.data![index].id),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text("Click to restore"),
                                        Icon(
                                          Icons.restore,
                                          color: Colors.blue,
                                        )
                                      ],
                                    )),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                //ngan chan ListView no' cuon xuong' duoc, xai` cho SingleChildScrollView-column
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data![index].ctHoaDon.length,
                                itemBuilder: (context, indexCT) => buildItemHoaDon(
                                    context: context,
                                    tenSanPham: snapshot.data![index].ctHoaDon[indexCT].sanPham.tenSanPham,
                                    hinhAnh: snapshot.data![index].ctHoaDon[indexCT].sanPham.hinhAnh,
                                    moTa: snapshot.data![index].ctHoaDon[indexCT].sanPham.moTa,
                                    giaBan: snapshot.data![index].ctHoaDon[indexCT].giaBan,
                                    soLuong: snapshot.data![index].ctHoaDon[indexCT].soLuong),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
                                    boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black, offset: Offset(1, 1))] // Make rounded corner of border
                                    ),
                                child: ListTile(
                                  title: Text(
                                    "Total: ${formatNumber.format(snapshot.data![index].tongTien)}",
                                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                    "${snapshot.data![index].tongSoLuong} product",
                                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
      //nho' thay doi? lai con so' truyen du~ lieu
      //bottomNavigationBar: const BottomNavBar(0),
    );
  }
}
