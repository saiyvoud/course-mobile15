import 'package:flutter/material.dart';

class ProductComponent extends StatefulWidget {
  const ProductComponent({super.key});

  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 0.8,
          
        ),
        itemBuilder: (context, index) {
          return Card(
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
                  child: Image.network(
                      "https://img.lazcdn.com/g/p/ee75a0cc5511d90e9aedc9f41d9ed284.jpg_200x200q80.jpg_.webp"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ເສື້ອແຟຣຊັນໃຫມ່ອອກໃຫມ່ນຳເຂົ້າຈາກປະເທດໄທຍ ມີຫລາຍສີໃຫ້ເລືອກ",
                    style: TextStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "120,000 Lak",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
