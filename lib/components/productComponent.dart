import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/provider/product_provider.dart';
import 'package:shopgood/view/home/widget/home_detail.dart';


class ProductComponent extends StatefulWidget {
  const ProductComponent({super.key});

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
      if (productProvider.loading == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (productProvider.products.isEmpty) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: productProvider.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            mainAxisSpacing: 0.8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetail(index:index),
                  ),
                );
              },
              child: Card(
                color: Colors.white,
                elevation: 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      // child: Image.network(
                      //   categoryProvider.product[categoryProvider.currenIndex]
                      //       ['image'],
                      // ),
                      child: Image.network(
                          productProvider.products[index]['image']),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        productProvider.products[index]['detail'],
                        style: TextStyle(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "${productProvider.products[index]['price']}Lak",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
