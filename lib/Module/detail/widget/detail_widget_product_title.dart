part of '../detail_page.dart';

class DetailWidgetProductTitle extends GetView<DetailController> {
  const DetailWidgetProductTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: ThemeConfig.defaultPaddingAll),
              child: Text(
                controller.sanPham.tenSanPham!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            //rating
            Row(
              children: [
                const SizedBox(width: ThemeConfig.defaultPaddingAll / 1.3),
                RatingBarIndicator(
                    rating: controller.sanPham.star!,
                    itemSize: 25.0,
                    itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        )),
                //khoang cach' can le` cho le :v
                Expanded(child: Text("   ${controller.sanPham.star!.toStringAsFixed(2)}")),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 15, 5, 15),
                  //width: 64,
                  decoration: BoxDecoration(
                    color: true ? Colors.red.withOpacity(0.1) : Theme.of(context).hoverColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      true ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_outline, color: Colors.red),
                      const SizedBox(width: 5),
                      const Icon(Icons.share, color: Colors.grey),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: ThemeConfig.defaultPaddingAll),
              child: Row(
                children: [
                  Text(
                    //chua xu ly'
                    '${Helper.formatNumber(controller.giaBan - controller.giaGiam)} đ',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
                  ),
                  const SizedBox(width: 5),
                  Text('${Helper.formatNumber(controller.giaBan)} đ',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue,
                        decoration: TextDecoration.lineThrough,
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
