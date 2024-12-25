import 'dart:convert';

import 'package:flipkart_project/all_models/category_model.dart';
import 'package:flipkart_project/all_models/product_model.dart';
import 'package:flipkart_project/all_screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static const _productKey = 'product';
  static const _categoryKey = 'CategoryProduct';

  Future<void> saveData(BuildContext context, String email, String password,
      String confirmPassword) async {


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('email', email);
    await sharedPreferences.setString('password', password);



  }

  Future<void> getData(context, email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? storedEmail = sharedPreferences.getString('email');
    String? storedPassword = sharedPreferences.getString('password');

    if (email == storedEmail && password == storedPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful')),
      );

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const DashboardScreen();
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong email or password')),
      );
    }
  }

  Future<void> setString(Product product) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> productList =
        sharedPreferences.getStringList(_productKey) ?? [];
    Map<String, dynamic> map = product.toMap();
    String mapStr = jsonEncode(map);
    productList.add(mapStr);
    sharedPreferences.setStringList('product', productList);
  }

  Future<List<Product>> getString() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> productList =
        sharedPreferences.getStringList(_productKey) ?? [];
    List<Product> list = [];
    for (int i = 0; i < productList.length; i++) {
      String strMap = productList[i];
      Map<String, dynamic> map = jsonDecode(strMap);
      Product product = Product.fromMap(map);
      list.add(product);
    }
    return list;
  }

  Future<void> setCategoryList(CategoryItem categoryItem) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> stringList =
        sharedPreferences.getStringList(_categoryKey) ?? [];
    Map<String, dynamic> map = categoryItem.toMapList();
    String str = jsonEncode(map);
    stringList.add(str);
    sharedPreferences.setStringList(_categoryKey, stringList);
  }

  Future<List<CategoryItem>> getCategoryList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> strList = sharedPreferences.getStringList(_categoryKey) ?? [];
    List<CategoryItem> list = [];
    for (int i = 0; i < strList.length; i++) {
      String containItem = strList[i];
      Map<String, dynamic> map = jsonDecode(containItem);
      CategoryItem items = CategoryItem.fromMapList(map);
      list.add(items);
    }
    return list;

  }Future deleteItem(CategoryItem itemList)
async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.remove(_categoryKey);
}
}
