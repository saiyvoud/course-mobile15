import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "ລາຍການສິ້ນຄ້າ",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 4,
                itemBuilder: (item, index) {
                  return Column(
                    children: [
                      Container(
                        height: 5,
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                "https://img.lazcdn.com/g/ff/kf/S896b1f95f47b44629d8d35b0edaf2e3al.jpg_400x400q80.jpg_.webp",
                                height: 100,
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ໂທລະສັບ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "ໂທລະສັບອອກໃຫມ່ງາມສາມາດຖ່າຍຮູບແບບສະເຫນືອນຈິ່ງກັນນ້ຳມີຫລາຍສີ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "5,500,000 LAK",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        //decoration: BoxDecoration(color: Colors.cyan),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("ລາຄາທັງໝົດ:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("20,000,000 LAK",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red,),),
                )
              ],
            ),
              SizedBox(height: 10),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.green.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "ຊຳລະເງີນ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
