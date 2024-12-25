import 'package:flipkart_project/all_models/product_model.dart';
import 'package:flipkart_project/core(common%20files)/functions.dart';
import 'package:flutter/material.dart';


class ProductProvider extends ChangeNotifier{
  final  get=StorageHelper();
  List<Product> productList = [];

  Future loadProduct() async {
    productList = await get.getString();
    notifyListeners();

  }
}