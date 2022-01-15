import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../all_page.dart';

// ignore: must_be_immutable
class ToPayTab extends StatefulWidget {
  // ignore: non_constant_identifier_names
  int TrangThai;
  bool? check=false;
  // ignore: non_constant_identifier_names
  ToPayTab({Key? key, required this.TrangThai,  this.check}) : super(key: key);

  @override
  _ToPayTabState createState() => _ToPayTabState();
}

class _ToPayTabState extends State<ToPayTab> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    final quanLyHoaDon = Provider.of<QuanLyHoaDonController>(context);
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          FutureBuilder<List<CT_HoaDon>>(
              future: quanLyHoaDon.getDataQuanLyHoaDon(widget.TrangThai),
              builder: (context, snap) {
                if (snap.hasError) {
                  return Text(snap.error.toString());
                }
                if (snap.hasData) {
                  if (snap.data!.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/idea.svg",
                            width: 200,
                            height: 200,
                          ),
                          const Text(
                            "There are no orders place yet.",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 30),
                              alignment: Alignment.center,
                              width: 200,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  gradient: LinearGradient(colors: [
                                    Colors.red,
                                    Colors.orange,
                                  ]),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      color: Colors.pink,
                                      blurRadius: 16.0,
                                    ),
                                  ]),
                              child:
                                  const Text("Continute Shopping", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snap.data!.length,
                      itemBuilder: (context, index) {
                        if (widget.check == true) {
                          if (snap.data![index].Star == 0) {
                            return Stack(
                              children: [
                                buildSanPhamQuanLyHoaDon(snap.data![index], context, check: true),
                                Expanded(
                                  child: Positioned(
                                    right: 3.0,
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
                                                          showCustomLoadding();
                                                          final addStar = await api_Danh_Gia_SanPham(
                                                              snap.data![index].HoaDonId!, snap.data![index].SanPhamId, rating.toInt());

                                                          if (addStar) {
                                                            thongBaoScaffoldMessenger(context, "Add Success");
                                                            Navigator.pop(context);
                                                            EasyLoading.dismiss();
                                                          } else {
                                                            (thongBaoScaffoldMessenger(context, "Fails add"));
                                                            //(context as Element).reassemble();
                                                            EasyLoading.dismiss();
                                                          }
                                                        },
                                                        child: const Text("Submit"),
                                                      ),
                                                    )
                                                  ],
                                                ));
                                      },
                                      child: const Text("Review"),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }
                          return const Text("");
                          // return Padding(
                          //   padding: const EdgeInsets.only(top: 80.0),
                          //   child: Column(
                          //     children: [
                          //       Center(
                          //         child: Expanded(
                          //           child: SvgPicture.asset(
                          //             "assets/icons/idea.svg",
                          //             width: 200,
                          //             height: 200,
                          //           ),
                          //         ),
                          //       ),
                          //       const SizedBox(
                          //         height: 10,
                          //       ),
                          //       TextButton(
                          //         onPressed: () => Navigator.pushNamedAndRemoveUntil(context, "/Home", (route) => false),
                          //         child: Container(
                          //             width: 150,
                          //             height: 50,
                          //             decoration: BoxDecoration(color: Colors.amber[900], borderRadius: BorderRadius.circular(30), boxShadow: const [
                          //               BoxShadow(
                          //                 offset: Offset(0, 0),
                          //                 color: Colors.pink,
                          //                 blurRadius: 16.0,
                          //               ),
                          //             ]),
                          //             child: const Align(
                          //               alignment: Alignment.center,
                          //               child: Text(
                          //                 "Continute Shopping",
                          //                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                          //               ),
                          //             )),
                          //       ),
                          //     ],
                          //   ),
                          // );
                        } else {
                          return buildSanPhamQuanLyHoaDon(snap.data![index], context, check: false);
                        }
                        //return buildSanPhamQuanLyHoaDon(snap.data![index]);
                      });
                }

                return const Text("");
              })
        ],
      ),
    ));
  }
}

Widget buildSanPhamQuanLyHoaDon(CT_HoaDon ctHd, BuildContext context, {required bool check}) {
  return ListTile(
    leading: InkWell(
      onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(sanPham: ctHd.sanPham!)));
      },
      child: CachedNetworkImage(
        width: 100,
        height: 100,
        imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/${ctHd.sanPham!.hinhAnh}",
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
      ctHd.sanPham!.tenSanPham.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "price: " + formatNumber.format(ctHd.GiaBan),
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        Builder(builder: (context) {
          if (check == true) {
            return RatingBarIndicator(
                rating: double.parse(ctHd.Star.toString()),
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
        Text("Quty: ${ctHd.SoLuong}")
      ],
    ),
  );
}
