import 'package:do_an_flutter/Config/theme.dart';
import 'package:flutter/material.dart';

class DetailWidgetProductComment extends StatelessWidget {
  const DetailWidgetProductComment({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
}
