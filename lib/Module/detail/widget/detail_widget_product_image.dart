part of '../detail_page.dart';

class DetailWidgetProductImage extends GetView<DetailController> {
  const DetailWidgetProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt selectedImage = 0.obs;
    final CarouselController controllerCar = CarouselController();

    return Obx(() => SliverList(
            delegate: SliverChildListDelegate([
          CarouselSlider(
            carouselController: controllerCar,
            options: CarouselOptions(
              autoPlay: true, //tu dong chay
              //reverse: true, //dao? nguoc chay
              autoPlayInterval: const Duration(seconds: 7), //mac dinh la 4
              //enlargeCenterPage: true, //lam noi bat trung tam hinh`
              aspectRatio: 2.3, //height
              viewportFraction: 1.0, //chi hien thi 1 hinh` anh?
              onPageChanged: (index, reason) => selectedImage.value = index,
            ),
            items: controller.sanPham.hinhAnh!
                .map((item) => Hero(
                    tag: item.sanPhamId.toString(),
                    child: imageNetwork(
                      item.hinhAnh!,
                      width: MediaQuery.of(context).size.width,
                    )))
                .toList(),
          ),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(
                controller.sanPham.hinhAnh!.length,
                (index) => GestureDetector(
                      onTap: () => controllerCar.animateToPage(index),
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        padding: const EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.width / 7,
                        width: MediaQuery.of(context).size.width / 7,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(selectedImage.value == index ? 1 : 0)),
                        ),
                        child: imageNetwork(controller.sanPham.hinhAnh![index].hinhAnh!),
                      ),
                    )),
          )
        ])));
  }
}
