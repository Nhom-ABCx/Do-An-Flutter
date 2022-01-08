import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_application_1/DB/database_mb.dart';
import 'package:provider/provider.dart';
import '../all_page.dart';

class buildItem extends StatefulWidget {
  SanPham sanPham;
  buildItem(this.sanPham, {Key? key}) : super(key: key);
  @override
  _buildItemState createState() => _buildItemState();
}

// ignore: camel_case_types
class _buildItemState extends State<buildItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Db db = Db();
    final cart = Provider.of<CartProvider>(context);
    //  final id=Provider.of<CartModel>(context).id;
    //var autoId=id++;
    return Container(
      width: 200,
      height: 750,
      //color: Colors.indigo,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: CachedNetworkImage(
                      imageUrl: "http://10.0.2.2:8000/storage/assets/images/product-image/" + widget.sanPham.hinhAnh!,
                      width: 100,
                      height: 120,
                      placeholder: (context, url) => const Center(
                        child: CupertinoActivityIndicator(),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.black12,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(sanPham: widget.sanPham)));
                    },
                  ),
                ),
              ),
              //ten san pham
              Text(
                widget.sanPham.tenSanPham,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              widget.sanPham.giamGia == 0
                  ? Text("Giá: " + formatNumber.format(widget.sanPham.giaBan),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.blueAccent))
                  : Text("Giá slae: " + (formatNumber.format(widget.sanPham.giaBan! - widget.sanPham.giamGia!)),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red)),

              Text(
                'Còn:' + widget.sanPham.soLuongTon.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red),
              ),
            ],
          ),
          //yeu tich
          Positioned(
              right: 0.0,
              top: 0.0,
              child: IconButton(
                onPressed: () async {
                  if (widget.sanPham.isFavorite != 0) {
                    //neu dang check
                    await api_Delete_KhachHang_YeuThich_SanPham(Auth.khachHang.id!, widget.sanPham.id!)
                        ? setState(() => widget.sanPham.isFavorite = 0)
                        : null;
                  } else {
                    await api_Insert_KhachHang_YeuThich_SanPham(Auth.khachHang.id!, widget.sanPham.id!)
                        ? setState(() => widget.sanPham.isFavorite = 1)
                        : null;
                  }
                },
                icon: widget.sanPham.isFavorite!.isOdd
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border),
              )),
          //add cart
          Positioned(
            right: 5.0,
            bottom: 5.0,
            child: Align(
                alignment: const Alignment(3, 0),
                child: InkWell(
                  onTap: () async {
                    Cart crt = Cart(
                      id: widget.sanPham.id,
                      productId: widget.sanPham.id!,
                      productName: widget.sanPham.tenSanPham,
                      inintPrice: widget.sanPham.giaBan!,
                      productPrice: widget.sanPham.giaBan!,
                      quantity: 1,
                      productImg: widget.sanPham.hinhAnh!,
                    );
                    // tạo biến kiểm tra sản phẩm thêm vào cart có tồn tại chưa
                    bool check = await db.ifPrdExitsCart(crt);
                    // tạo biến kiểm tra sản phẩm thêm vào cart có tồn tại chưa
                    if (check) {
                      // tạo biến kiểm tra số lượng tồn và số lượng trong cart
                      final sp = await fetchProductData(widget.sanPham.id.toString());
                      bool checkStock = await db.checkStocProduct(sp.soLuongTon!, crt);
                      //nếu true =>số lượng tồn sản phẩm > số lượng trong item trong cart
                      if (checkStock) {
                        thongBaoScaffoldMessenger(context, "Product exits cart");
                        db.updateQuantity(crt);
                        cart.addTotalPrice(double.parse(crt.productPrice.toString()));
                      }
                      // số lượng tồn = số lượng trong cart
                      else {
                        thongBaoScaffoldMessenger(context, "Limited quantity");
                      }
                    } else {
                      db.insertItemCart(crt).then((value) {
                        thongBaoScaffoldMessenger(context, "Add cart complete");
                        cart.addTotalPrice(double.parse(widget.sanPham.giaBan.toString()));
                      }).onError((error, stackTrace) {
                        print(error.toString());
                      });
                    }
                  },
                  child: const Icon(
                    Icons.add_circle,
                    color: Colors.green,
                    size: 40.0,
                  ),
                )),
          ),
          //rating
          Positioned(
              bottom: 0.0,
              child: RatingBarIndicator(
                  rating: widget.sanPham.star!,
                  itemSize: 20.0,
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  })),
        ],
      ),
    );
  }
}
