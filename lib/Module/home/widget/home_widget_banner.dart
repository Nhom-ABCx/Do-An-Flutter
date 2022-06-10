import 'package:carousel_slider/carousel_slider.dart';
import 'package:do_an_flutter/Model/hinh_anh.dart';
import 'package:do_an_flutter/Widget/build_widgets.dart';
import 'package:flutter/material.dart';

class HomeWidgetBanner extends StatefulWidget {
  const HomeWidgetBanner(this.images, {Key? key}) : super(key: key);
  final List<HinhAnh> images;

  @override
  State<HomeWidgetBanner> createState() => _HomeWidgetBannerState();
}

class _HomeWidgetBannerState extends State<HomeWidgetBanner> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          autoPlay: true, //tu dong chay
          //reverse: true, //dao? nguoc chay
          //autoPlayInterval: const Duration(seconds: 4), //mac dinh la 4
          //enlargeCenterPage: true, //lam noi bat trung tam hinh`
          aspectRatio: 2.5, //height
          viewportFraction: 1.0, //chi hien thi 1 hinh` anh?
          onPageChanged: (index, reason) => setState(() => _current = index),
        ),
        items: widget.images
            .map((item) => Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: [
                          imageNetwork(item.hinhAnh!, fit: BoxFit.cover),
                          // Positioned(
                          //   bottom: 0.0,
                          //   left: 0.0,
                          //   right: 0.0,
                          //   child: Container(
                          //     decoration: const BoxDecoration(
                          //       gradient: LinearGradient(
                          //         colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                          //         begin: Alignment.bottomCenter,
                          //         end: Alignment.topCenter,
                          //       ),
                          //     ),
                          //     padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          //     child: Text(
                          //       'No. ${widget.images.indexOf(item)} image',
                          //       style: const TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 20.0,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      )),
                ))
            .toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            widget.images.length,
            (index) => GestureDetector(
                  onTap: () => _controller.animateToPage(index),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black)
                            .withOpacity(_current == index ? 0.9 : 0.4)),
                  ),
                )),
      ),
    ]);
  }
}
