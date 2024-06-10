import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopgood/provider/cart_provider.dart';

import 'package:shopgood/view/payment/payment.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  @override
  void initState() {
   
    super.initState();
    Provider.of<CartProvider>(context, listen: false)..getCarts();
  }

  var sum;
  calulator(amount, price) {
    sum = amount * price;

    print(sum);
  }

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
      body: Consumer<CartProvider>(builder: (context, cartProvider, child) {
        if (cartProvider.loading == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (cartProvider.carts.length == 0) {
          return Center(
            child: Text("ຍັງບໍ່ມີຂໍ້ມູນ"),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: cartProvider.carts.length,
                  itemBuilder: (item, index) {
                    final data = cartProvider.carts;

                    sum = data[index]['qty'] * data[index]['price'];
                    // cartProvider.calulatorSum(
                    //     data[index]['qty'], data[index]['price']);
                    // sum += data[index]['qty']z * data[index]['price'];
                    return Column(
                      children: [
                        Container(
                          height: 5,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade100),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  data[index]['image'].toString(),
                                  height: 100,
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['name'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      data[index]['detail'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${data[index]['price']} LAK",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                            "${data[index]['qty'].toString()} /ຈຳນວນ")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    print("ok");
                                    cartProvider.deleteCartID(id: index);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    );
                  })
            ],
          ),
        );
      }),
      bottomNavigationBar:
          Consumer<CartProvider>(builder: (context, cartP, child) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Payment()));
          },
          child: Container(
            height: 120,
            //decoration: BoxDecoration(color: Colors.cyan),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "ລາຄາທັງໝົດ:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "${sum} LAK",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
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
      }),
    );
  }
}
