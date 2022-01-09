import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../all_page.dart';

// ignore: must_be_immutable
class ToPayTab extends StatefulWidget {
  // ignore: non_constant_identifier_names
  int TrangThai;
  // ignore: non_constant_identifier_names
  ToPayTab({Key? key, required this.TrangThai}) : super(key: key);

  @override
  _ToPayTabState createState() => _ToPayTabState();
}

class _ToPayTabState extends State<ToPayTab> {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: Column(
          children: [
            FutureBuilder<List<CT_HoaDon>>(
                future: api_Get_SanPham_Pay(widget.TrangThai),
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
                                child: const Text("Continute Shopping",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snap.data!.length,
                        itemBuilder: (context, index) {
                          return _buildSanPhamQuanLyHoaDon(snap.data![index]);
                        });
                  }
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                })
          ],
        ),
      ));
}

Widget _buildSanPhamQuanLyHoaDon(CT_HoaDon ctHd) {
  return ListTile(
    leading: CachedNetworkImage(
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
    title: Text(ctHd.sanPham!.tenSanPham.toString()),
    subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [Text(formatNumber.format(ctHd.GiaBan)), Text("Quty: ${ctHd.SoLuong}")],
    ),
  );
}
