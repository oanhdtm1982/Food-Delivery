import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/banner1.png',
  'assets/images/banner2.png',
  'assets/images/banner3.png',
];

class BannerHome extends StatelessWidget {
  BannerHome({Key? key}) : super(key: key);

  final List<Widget> imageSliders = imgList
      .map((item) => ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            children: <Widget>[
              Image.asset(item, fit: BoxFit.cover, width: 1000, height: 700,),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(77, 156, 249, 1)
                    ),
                    child: Container()),
              ),
            ],
          ))).toList();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.8,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: imageSliders,
    );
  }
}
