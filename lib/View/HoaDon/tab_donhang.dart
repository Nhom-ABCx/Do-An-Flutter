import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../../all_page.dart';

// ignore: must_be_immutable
class TabDonHang extends StatefulWidget {
  // ignore: non_constant_identifier_names
  int TrangThai;
  bool? check = false;
  // ignore: non_constant_identifier_names
  TabDonHang({Key? key, required this.TrangThai, this.check}) : super(key: key);

  @override
  _TabDonHangState createState() => _TabDonHangState();
}

class _TabDonHangState extends State<TabDonHang> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<QuanLyHoaDonController>(
      builder: (context, quanLyHoaDonController, child) => FutureBuilder<List<HoaDon>>(
          future: quanLyHoaDonController.getData(widget.TrangThai),
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
                    //cai nay` cua Vinh
                    // if (widget.check == true) {
                    //   if (snapshot.data![index].star == 0) {
                    //     return Stack(
                    //       children: [
                    //         _buildSanPhamQuanLyHoaDon(snapshot.data![index], context, check: true),
                    //         Expanded(
                    //           child: Positioned(
                    //             right: 3.0,
                    //             child: TextButton(
                    //               onPressed: () {
                    //                 showDialog(
                    //                     context: context,
                    //                     builder: (context) => AlertDialog(
                    //                           title: const Text("Evaluate"),
                    //                           content: RatingBar.builder(
                    //                               minRating: 0.0,
                    //                               itemBuilder: (context, index) => const Icon(
                    //                                     Icons.star,
                    //                                     color: Colors.amber,
                    //                                   ),
                    //                               onRatingUpdate: (rating) => setState(() {
                    //                                     this.rating = rating;
                    //                                   })),
                    //                           actions: [
                    //                             SizedBox(
                    //                               width: MediaQuery.of(context).size.width,
                    //                               child: ElevatedButton(
                    //                                 onPressed: () async {
                    //                                   showCustomLoadding();
                    //                                   final addStar = await api_Danh_Gia_SanPham(
                    //                                       snapshot.data![index].hoaDonId!, snapshot.data![index].sanPhamId, rating.toInt());

                    //                                   if (addStar) {
                    //                                     thongBaoScaffoldMessenger(context, "Add Success");
                    //                                     Navigator.pop(context);
                    //                                     EasyLoading.dismiss();
                    //                                   } else {
                    //                                     (thongBaoScaffoldMessenger(context, "Fails add"));
                    //                                     //(context as Element).reassemble();
                    //                                     EasyLoading.dismiss();
                    //                                   }
                    //                                 },
                    //                                 child: const Text("Submit"),
                    //                               ),
                    //                             )
                    //                           ],
                    //                         ));
                    //               },
                    //               child: const Text("Review"),
                    //             ),
                    //           ),
                    //         )
                    //       ],
                    //     );
                    //   }
                    // }
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
                            //neu trang thai'khac' DangGiao,DaGiao va` ko phai thanh toan' khi nhan hang` thi` co the huy
                            trailing: ((snapshot.data![index].trangThai != 4 && snapshot.data![index].trangThai != 5) &&
                                    (snapshot.data![index].phuongThucThanhToan == 1))
                                ? TextButton(
                                    onPressed: () => quanLyHoaDonController.deleteData(context, snapshot.data![index].id),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text("Click to cancel"),
                                        Icon(
                                          Icons.delete_forever,
                                          color: Colors.red,
                                        )
                                      ],
                                    ))
                                : null,
                          ),
                          //hien thi tung phan tu ct hoa don cua hoa don
                          ListView.builder(
                            shrinkWrap: true,
                            //ngan chan ListView no' cuon xuong' duoc, xai` cho SingleChildScrollView-column
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data![index].ctHoaDon.length,
                            itemBuilder: (context, indexCT) => buildItemGioHang(
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
          }),
    ));
  }
}

Widget _buildSanPhamQuanLyHoaDon(CT_HoaDon ctHd, BuildContext context, {required bool check}) {
  return ListTile(
    leading: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(sanPham: ctHd.sanPham)));
      },
      child: CachedNetworkImage(
        width: 100,
        height: 100,
        imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/${ctHd.sanPham.hinhAnh}",
        placeholder: (context, url) => const Center(
          child: CupertinoActivityIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.red,
          size: 50,
        ),
      ),
    ),
    title: Text(
      ctHd.sanPham.tenSanPham.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "price: " + formatNumber.format(ctHd.giaBan),
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        Builder(builder: (context) {
          if (check == true) {
            return RatingBarIndicator(
                rating: double.parse(ctHd.star.toString()),
                itemSize: 15.0,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                });
          }
          return const Text("");
        }),
        Text("Quty: ${ctHd.soLuong}")
      ],
    ),
  );
}
