import 'package:cached_network_image/cached_network_image.dart';
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
            if (widget.check == true) {
              return FutureBuilder<List<CT_HoaDon>>(
                  future: api_San_Pham_Can_Danh_Gia(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }

                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return khongCoGiHet(context, "There are no orders place yet.", "assets/icons/idea.svg");
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          //ngan chan ListView no' cuon xuong' duoc, xai` cho SingleChildScrollView-column
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                // const SizedBox(height: 10),
                                buildSanPhamCTHD(snapshot.data![index], context),
                                Positioned(
                                    right: 0.0,
                                    child: TextButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    title: const Text("Evaluate"),
                                                    content: RatingBar.builder(
                                                        minRating: 0.0,
                                                        itemBuilder: (context, index) => const Icon(
                                                              Icons.star,
                                                              color: Colors.amber,
                                                            ),
                                                        onRatingUpdate: (rating) => setState(() {
                                                              this.rating = rating;
                                                            })),
                                                    actions: [
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width,
                                                        child: ElevatedButton(
                                                          onPressed: () async {
                                                            quanLyHoaDonController.danhGiaSanPham(context, snapshot.data![index].hoaDonId!,
                                                                snapshot.data![index].sanPham.id!, rating.toInt());
                                                          },
                                                          child: const Text("Submit"),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                        },
                                        child: const Text('Review')))
                              ],
                            );
                          });
                    }
                    return const Center(child: CircularProgressIndicator());
                  });
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
                    //khi nhap vao cac tap khac
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
                          ListTile(
                            title: const Text("Payment Method:"),
                            trailing: Text(_phuongThucThanhToan(snapshot.data![index].phuongThucThanhToan!)),
                          ),

                          //hien thi tung phan tu ct hoa don cua hoa don
                          ListView.builder(
                              shrinkWrap: true,
                              //ngan chan ListView no' cuon xuong' duoc, xai` cho SingleChildScrollView-column
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data![index].ctHoaDon.length,
                              itemBuilder: (context, indexCT) {
                                return buildItemHoaDon(
                                  context: context,
                                  tenSanPham: snapshot.data![index].ctHoaDon[indexCT].sanPham.tenSanPham,
                                  hinhAnh: snapshot.data![index].ctHoaDon[indexCT].sanPham.hinhAnh,
                                  moTa: snapshot.data![index].ctHoaDon[indexCT].sanPham.moTa,
                                  giaBan: snapshot.data![index].ctHoaDon[indexCT].giaBan,
                                  soLuong: snapshot.data![index].ctHoaDon[indexCT].soLuong,
                                );
                              }),
                          showTotal(snapshot.data![index].tongTien, snapshot.data![index].tongSoLuong, widget.check)
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

String _phuongThucThanhToan(int phuongThuc) {
  switch (phuongThuc) {
    case 2:
      return "Credit Card";
    case 3:
      return "MOMO";
    case 4:
      return "Viettel Pay";
    case 5:
      return "ZaloPay";
    default:
      return "Payment on delivery";
  }
}

Widget showTotal(double? tongTien, int? tongSoLuong, bool? check) {
  if (check == true) {
    return const SizedBox();
  } else {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set rounded corner radius
          boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black, offset: Offset(1, 1))] // Make rounded corner of border
          ),
      child: ListTile(
        title: Text(
          "Total: ${formatNumber.format(tongTien)}",
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          "$tongSoLuong product",
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Widget buildSanPhamCTHD(CT_HoaDon cthoadon, BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ), // Set rounded corner radius
    width: MediaQuery.of(context).size.width,
    //height: 125,
    //constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.width / (3)),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 130,
          child: CachedNetworkImage(
            imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/" + cthoadon.sanPham.hinhAnh!,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.black12,
            ),
          ),
        ),
        //bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(text: TextSpan(style: const TextStyle(color: Colors.black), text: cthoadon.sanPham.tenSanPham)),
              const SizedBox(height: 20),
              Text(
                cthoadon.sanPham.moTa ?? "",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(formatNumber.format(cthoadon.giaBan) + " VNĐ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text("Quantily: ${cthoadon.soLuong}", style: const TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ))
      ],
    ),
  );
}
