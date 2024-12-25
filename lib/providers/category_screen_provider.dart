import 'package:flipkart_project/all_models/category_model.dart';
import 'package:flipkart_project/core(common%20files)/functions.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier{
  final storageHelper = StorageHelper();
  List<CategoryItem> itemList = [];
  Future<void> getCategoryList() async {

    itemList = await storageHelper.getCategoryList();
notifyListeners();
  }
  Future<void> deleteItm(int index) async {
    await storageHelper.deleteItem(itemList[index]);
    itemList.removeAt(index);
    notifyListeners();

  }

}
