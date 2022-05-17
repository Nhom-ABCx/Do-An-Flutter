import 'package:do_an_flutter/Config/theme.dart';
import 'package:flutter/material.dart';

class DetailWidgetColorDots extends StatefulWidget {
  const DetailWidgetColorDots(this.colors, {Key? key}) : super(key: key);
  final List<Color> colors;

  @override
  State<DetailWidgetColorDots> createState() => _DetailWidgetColorDotsState();
}

class _DetailWidgetColorDotsState extends State<DetailWidgetColorDots> {
  // Now this is fixed and only for demo
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeConfig.defaultPaddingAll),
      child: Row(
        children: [
          ...List.generate(
            widget.colors.length,
            (index) => GestureDetector(
              onTap: () => setState(() => selectedColor = index),
              child: Container(
                //duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(8),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: index == selectedColor ? Theme.of(context).colorScheme.primary : Colors.transparent),
                  shape: BoxShape.circle,
                ),
                child: DecoratedBox(decoration: BoxDecoration(color: widget.colors[index], shape: BoxShape.circle)),
              ),
            ),
          ),
          const Spacer(),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle),
              child: RawMaterialButton(
                shape: const CircleBorder(),
                onPressed: () {},
                child: const Icon(Icons.remove),
              )),
          const SizedBox(width: 20),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle),
              child: RawMaterialButton(
                shape: const CircleBorder(),
                onPressed: () {},
                child: const Icon(Icons.add),
              ))
        ],
      ),
    );
  }
}
