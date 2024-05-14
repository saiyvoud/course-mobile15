import 'package:flutter/material.dart';

class HomeDetailItem extends StatefulWidget {
  const HomeDetailItem({super.key});

  @override
  State<HomeDetailItem> createState() => _HomeDetailItemState();
}

class _HomeDetailItemState extends State<HomeDetailItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://img.lazcdn.com/g/p/ee75a0cc5511d90e9aedc9f41d9ed284.jpg_200x200q80.jpg_.webp",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          top: 35,
          left: 10,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 25,
              ),
            ),
          ),
        ),
        Positioned(
          top: 35,
          right: 10,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.favorite,
              color: Colors.red.shade300,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
