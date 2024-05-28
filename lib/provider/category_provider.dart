import 'package:flutter/material.dart';
import 'package:shopgood/models/category_model.dart';
import 'package:shopgood/service/category_service.dart';

class CateogryProvider extends ChangeNotifier {
  
List<dynamic> product = [
  {
    "id": 1,
    "name": "ເສື້ອແຟຣຊັນໃຫມ່ອອກໃຫມ່ນຳເຂົ້າຈາກປະເທດໄທຍ ມີຫລາຍສີໃຫ້ເລືອກ",
    "type": "ເສື້ອ",
    "image":
        "https://img.lazcdn.com/g/p/ee75a0cc5511d90e9aedc9f41d9ed284.jpg_200x200q80.jpg_.webp"
  },
   {
    "id": 2,
    "name": "ເສື້ອແຟຣຊັນໃຫມ່ອອກໃຫມ່ນຳເຂົ້າຈາກປະເທດໄທຍ ມີຫລາຍສີໃຫ້ເລືອກ",
    "type": "ເກີບ",
    "image":
        "https://lzd-img-global.slatic.net/g/p/0137dcd8b35ef818668e818218c1118f.jpg_200x200q80.jpg_.webp"
  },
];

 int _currenIndex = 0;
 bool _loading = false;
 List<CategoryModel> _categories = [];
 final categoryService = CategoryService();
 int get currenIndex => _currenIndex;
 bool get loading => _loading;
 List<CategoryModel> get categories => _categories;
   changeCategory(index)  {
    _currenIndex = index;
    notifyListeners();
  }
  Future<void> getCategory ()async{
    _loading = true;
    try {
      final result = await categoryService.getCategory();
      if(result!.length > 0){
       _categories = result;
       _loading = false;
       notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

}
