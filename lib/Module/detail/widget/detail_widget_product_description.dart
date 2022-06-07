part of '../detail_page.dart';

class DetailWidgetProductDescription extends StatefulWidget {
  const DetailWidgetProductDescription({Key? key}) : super(key: key);

  @override
  State<DetailWidgetProductDescription> createState() => _DetailWidgetProductDescriptionState();
}

class _DetailWidgetProductDescriptionState extends State<DetailWidgetProductDescription> {
  int? maxline = 3;
  TextOverflow? overflow = TextOverflow.ellipsis;

  final sanPham = Get.find<DetailController>().sanPham;
  @override
  Widget build(BuildContext context) {
    final lstThuocTinh = sanPham.thuocTinh!.entries;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //description
        Padding(
          padding: const EdgeInsets.fromLTRB(ThemeConfig.defaultPaddingAll, 0, ThemeConfig.defaultPaddingAll, 10),
          child: Text(
            "Description",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: (ThemeConfig.defaultPaddingAll)),
          child: Text(
            sanPham.moTa!,
            maxLines: maxline,
            overflow: overflow, //...
          ),
        ),
        //see more detail
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: (ThemeConfig.defaultPaddingAll), vertical: 10),
          child: GestureDetector(
            onTap: () => setState(() {
              if (maxline == null && overflow == null) {
                maxline = 3;
                overflow = TextOverflow.ellipsis;
              } else {
                maxline = overflow = null;
              }
            }),
            child: Row(
              children: [
                Text(
                  (maxline != null && overflow != null) ? "See More Detail" : "Hide",
                  style: TextStyle(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: (ThemeConfig.defaultPaddingAll)),
          child: Text(
            "Properties",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: (ThemeConfig.defaultPaddingAll)),
          child: Table(
            columnWidths: const {
              //0: FlexColumnWidth(2),
              0: FlexColumnWidth(),
              1: FlexColumnWidth(),
              //0: IntrinsicColumnWidth(),
            },
            defaultColumnWidth: const IntrinsicColumnWidth(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: const TableBorder(top: BorderSide(), bottom: BorderSide()),
            children: List.generate(sanPham.thuocTinh!.length, (index) {
              final thuocTinh = lstThuocTinh.elementAt(index);
              return _tableRow(thuocTinh.key, thuocTinh.value, index.isOdd ? Theme.of(context).hoverColor : null);
            }),
          ),
        ),
      ],
    );
  }

  TableRow _tableRow(String text1, String text2, Color? color) {
    return TableRow(decoration: BoxDecoration(color: color), children: [
      TableCell(child: Text(text1)),
      TableCell(child: Padding(padding: const EdgeInsets.symmetric(vertical: 5), child: Text(text2))),
    ]);
  }
}
