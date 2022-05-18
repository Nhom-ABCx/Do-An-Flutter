import 'package:do_an_flutter/Config/theme.dart';
import 'package:do_an_flutter/Model/product.dart';
import 'package:flutter/material.dart';

class DetailWidgetProductDescription extends StatefulWidget {
  const DetailWidgetProductDescription(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  State<DetailWidgetProductDescription> createState() => _DetailWidgetProductDescriptionState();
}

class _DetailWidgetProductDescriptionState extends State<DetailWidgetProductDescription> {
  int? maxline = 3;
  TextOverflow? overflow = TextOverflow.ellipsis;

  @override
  Widget build(BuildContext context) {
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
            widget.product.description,
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
            children:
                List.generate(5, (index) => _tableRow("Option $index", "ValueOption $index", index.isOdd ? Theme.of(context).hoverColor : null)),
          ),
        ),
        //------------------------
        Padding(
          padding: const EdgeInsets.all(ThemeConfig.defaultPaddingAll),
          child: Text(
            "Ratings",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        ..._ratingCard(),
        ..._ratingCard(),
      ],
    );
  }

  List<Widget> _ratingCard() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: (ThemeConfig.defaultPaddingAll)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i0.wp.com/www.printmag.com/wp-content/uploads/2021/02/4cbe8d_f1ed2800a49649848102c68fc5a66e53mv2.gif?fit=476%2C280&ssl=1"),
                  ),
                ),
                Text('UserName', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('Overall'),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                      child: Text('5'),
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: (ThemeConfig.defaultPaddingAll)),
        child: Text('Nice outdoor courts, solid concrete and good hoops for the neighborhood.'),
      ),
      const Divider(),
    ];
  }

  TableRow _tableRow(String text1, String text2, Color? color) {
    return TableRow(decoration: BoxDecoration(color: color), children: [
      TableCell(
        child: Padding(padding: const EdgeInsets.symmetric(vertical: 5), child: Text(text1)),
      ),
      TableCell(
        child: Text(text2),
      )
    ]);
  }
}
