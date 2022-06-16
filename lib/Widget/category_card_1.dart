import 'package:do_an_flutter/API/api_url.dart';
import 'package:do_an_flutter/API/base_getconnect.dart';
import 'package:do_an_flutter/Model/loai_san_pham.dart';
import 'package:do_an_flutter/Model/san_pham.dart';
import 'package:do_an_flutter/Module/search/view_more_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard1 extends StatelessWidget {
  final int? newItemCount;
  final LoaiSanPham loaiSanPham;

  const CategoryCard1(this.loaiSanPham, {Key? key, this.newItemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 100,
          child: InkWell(
            onTap: () async {
              //chi co thang` nay` xai` cho nen viet' chung vay` luon
              final apiCall = Get.find<BaseGetConnect>();

              final listCategory =
                  apiCall.onGetList(path: ApiUrl.get_search("san-pham"), baseModel: SanPham(), queryParam: {"LoaiSanPhamId": loaiSanPham.id});
              Get.to(ViewMorePage(title: loaiSanPham.tenLoai!, listSanPham: listCategory));
            },
            child: Card(
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    loaiSanPham.icon != null
                        ? IconData(int.parse(loaiSanPham.icon!.iconCode!), fontFamily: 'MaterialIcons')
                        : Icons.category_outlined,
                    size: 40,
                  ),
                  Text(
                    loaiSanPham.tenLoai!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
        newItemCount != null
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    //border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "$newItemCount",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}
