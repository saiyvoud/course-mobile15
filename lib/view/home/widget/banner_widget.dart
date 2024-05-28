import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/provider/banner_provider.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BannerProvider>(builder: (context, bannerProvider, child) {
      if(bannerProvider.loading == true){
        return Center(child: CircularProgressIndicator());
      }
      if(bannerProvider.banners!.isEmpty){
         return Center(child: CircularProgressIndicator());
      }
      return CarouselSlider(
        options: CarouselOptions(
            height: 140,
            autoPlay: true,
            viewportFraction: 1,
            // enlargeCenterPage: true,
            autoPlayAnimationDuration: Duration(milliseconds: 100)),
        items: bannerProvider.banners!.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Image.network(i.image.toString(), fit: BoxFit.cover),
              );
            },
          );
        }).toList(),
      );
    });

  }
}
