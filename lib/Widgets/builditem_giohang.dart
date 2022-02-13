import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../all_page.dart';

// ignore: camel_case_types, must_be_immutable
class buildItemGioHang extends StatefulWidget {
  BuildContext context;
  String? hinhAnh;
  String tenSanPham;
  String? moTa;
  double? giaBan;
  int? soLuong;
  int? soSao;
  buildItemGioHang({Key? key, required this.context, required this.tenSanPham, this.hinhAnh, this.moTa, this.giaBan, this.soLuong, this.soSao})
      : super(key: key);

  @override
  State<buildItemGioHang> createState() => _buildItemGioHangState();
}

class _buildItemGioHangState extends State<buildItemGioHang> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/" + widget.hinhAnh!,
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
                RichText(text: TextSpan(style: const TextStyle(color: Colors.black), text: widget.tenSanPham)),
                const SizedBox(height: 20),
                Text(
                  widget.moTa ?? "",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(formatNumber.format(widget.giaBan) + " VNĐ", style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text("Quantily: ${widget.soLuong}", style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}