// lib/auth_service.dart
import 'dart:convert';

import 'package:flipkart_project/all_models/product_model.dart';
import 'package:flipkart_project/all_screens/dashboard_screen.dart';
import 'package:flipkart_project/all_screens/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static const _productKey='product';
  Future<void> saveData(BuildContext context, String email, String password,
      String confirmPassword) async {
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('This field is required'),
        ),
      );
      return;
    }
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('email', email);
    await sharedPreferences.setString('password', password);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign Up Successful')),
    );

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LogInScreen();
    }));
  }Future<void> getData(context, email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? storedEmail = sharedPreferences.getString('email');
    String? storedPassword = sharedPreferences.getString('password');

    if (email == storedEmail && password == storedPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful')),
      );

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return DashboardScreen();
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wrong email or password')),
      );
    }
  }Future<void> setString(Product product)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    List<String> productList=sharedPreferences.getStringList(_productKey)??[];
    Map<String,dynamic> map=product.toMap();
    String mapstr=jsonEncode(map);
    productList.add(mapstr);
    sharedPreferences.setStringList('product', productList);


  } Future<List<Product>> getString()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    List<String> productList=sharedPreferences.getStringList(_productKey)??[];
    List<Product> list=[];
    for(int i=0; i<productList.length;i++){
      String strmap=productList[i];
      Map<String,dynamic> map=jsonDecode(strmap);
      Product product=Product.fromMap(map);
      list.add(product);

    }return list;


  }
}



