import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/components/data.dart';
import 'package:shopgood/provider/category_provider.dart';
import 'package:shopgood/provider/product_provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Consumer<CateogryProvider>(
      builder: (
        context,
        categoryProvider,
        child,
      ) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 35,
               
                  decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(child: Text("ແນະນຳ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryProvider.categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          categoryProvider.changeCategory(index);
                          productProvider.getProductByCategory(
                              categiryId:
                                  categoryProvider.categories[index].id.toString());
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: categoryProvider.currenIndex ==  index
                                ? Colors.red
                                : Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            categoryProvider.categories[index].title.toString(),
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
            ],
          ),
        );
      },
    );
  }
}
