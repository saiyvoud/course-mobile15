import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopgood/components/data.dart';
import 'package:shopgood/components/productComponent.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> banner = [
    "assets/images/banner01.jpg",
    "assets/images/banner02.jpg",
    "assets/images/banner03.jpg",
  ];
  int currenIndex = 0;
  onTap(_index) {
    setState(() {
      currenIndex = _index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: Icon(Icons.menu),
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.red,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.notification_add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 260,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Seacrh....",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        //prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.apps,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: 140,
                  autoPlay: true,
                  viewportFraction: 1,
                  // enlargeCenterPage: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 100)),
              items: banner.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Image.asset(i, fit: BoxFit.cover),
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        onTap(index);
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color:
                              currenIndex == index ? Colors.red : Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          category[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Text(
                    "Product",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.category),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text("ທັງໝົດ"),
                  ),
                ],
              ),
            ),
            ProductComponent(),
          ],
        ),
      ),
    );
  }
}
