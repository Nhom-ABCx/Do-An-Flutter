part of '../detail_page.dart';

class DetailWidgetColorDots extends GetView<DetailController> {
  const DetailWidgetColorDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    //int selectedColor = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeConfig.defaultPaddingAll),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildIconTop(context, icon: Icon(Icons.check, size: 30, color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(height: 10),
                    const Text(
                      "Hoàn tiền 100% nếu hàng giả",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    _buildIconTop(context, icon: Icon(Icons.verified_user, size: 25, color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(height: 10),
                    const Text(
                      "Mở hộp kiểm tra nhận",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    _buildIconTop(context, icon: Icon(Icons.undo, size: 30, color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(height: 10),
                    const Text(
                      "Đổi trả trong 30 ngày nếu lỗi",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Obx(() => Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: List.generate(controller.sanPham.thuocTinhToHop!.length, (index) {
                  (controller.lstToHop.length <= index) ? controller.lstToHop.add(controller.sanPham.lstThuocTinhValue![index].first) : null;

                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: ListTile(
                      title: Text(controller.sanPham.thuocTinhToHop![index]),
                      subtitle: DropdownButton<String>(
                          isExpanded: true,
                          value: controller.lstToHop[index],
                          onChanged: (String? value) =>controller.onChangDropDownThuocTinh(value, index),
                          items: controller.sanPham.lstThuocTinhValue![index]
                              .map((element) => DropdownMenuItem<String>(
                                    value: element,
                                    child: Text(element),
                                  ))
                              .toList()),
                    ),
                  );
                }),
              )),
          // Row(
          //   children: [
          //     ...List.generate(
          //       widget.colors.length,
          //       (index) => GestureDetector(
          //         onTap: () => setState(() => selectedColor = index),
          //         child: Container(
          //           //duration: const Duration(milliseconds: 250),
          //           padding: const EdgeInsets.all(8),
          //           height: 40,
          //           width: 40,
          //           decoration: BoxDecoration(
          //             border: Border.all(color: index == selectedColor ? Theme.of(context).colorScheme.primary : Colors.transparent),
          //             shape: BoxShape.circle,
          //           ),
          //           child: DecoratedBox(decoration: BoxDecoration(color: widget.colors[index], shape: BoxShape.circle)),
          //         ),
          //       ),
          //     ),
          //     const Spacer(),
          //     Container(
          //         width: 30,
          //         height: 30,
          //         decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle),
          //         child: RawMaterialButton(
          //           shape: const CircleBorder(),
          //           onPressed: () {},
          //           child: const Icon(Icons.remove),
          //         )),
          //     const SizedBox(width: 20),
          //     Container(
          //         width: 30,
          //         height: 30,
          //         decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle),
          //         child: RawMaterialButton(
          //           shape: const CircleBorder(),
          //           onPressed: () {},
          //           child: const Icon(Icons.add),
          //         ))
          //   ],
          // ),
        ],
      ),
    );
  }

  Container _buildIconTop(BuildContext context, {required Icon icon}) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      height: MediaQuery.of(context).size.width / 8,
      width: MediaQuery.of(context).size.width / 8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: icon,
    );
  }
}
