import 'package:flutter/material.dart';
import 'package:shopgood/home/widget/homedetail_item.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({super.key});

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  List<String> data = [
    "Size: S",
    "Size: M",
    "Size: L",
    "Size: XL",
    "Size: X2L",
  ];
  int currenIndex = 0;
  onTap(index) {
    setState(() {
      currenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            HomeDetailItem(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 350,
              ),
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ເສື້ອເຊີດ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("ເສື້ອເຊີດງາມໆລາຄາສະບາຍກະເປົ່າ"),
                              ],
                            ),
                            Spacer(),
                            Text(
                              "120,000 Lak",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      onTap(index);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: currenIndex == index
                                              ? Colors.red
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: currenIndex == index
                                              ? Border.all(
                                                  color: Colors.transparent)
                                              : Border.all(
                                                  color: Colors.grey,
                                                )),
                                      child: Center(
                                        child: Text(
                                          data[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: currenIndex == index
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            color: currenIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
