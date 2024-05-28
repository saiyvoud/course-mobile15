import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/components/data.dart';
import 'package:shopgood/provider/category_provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CateogryProvider>(
      builder: (
        context,
        categoryProvider,
        child,
      ) {
        return Container(
          height: 50,
          child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    categoryProvider.changeCategory(index);
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: categoryProvider.currenIndex == index
                          ? Colors.red
                          : Colors.amber,
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
        );
      },
    );
  }
}
