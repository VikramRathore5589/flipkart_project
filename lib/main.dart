import 'package:flipkart_project/all_screens/dashboard_screen.dart';
import 'package:flipkart_project/providers/add_product_screen_provider.dart';
import 'package:flipkart_project/providers/category_screen_provider.dart';
import 'package:flipkart_project/providers/dashboard_provider.dart';
import 'package:flipkart_project/providers/product_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return DashBoardProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return ProductProvider();
        }),ChangeNotifierProvider(create: (context) {
          return CategoryProvider();
        }),ChangeNotifierProvider(create: (context) {
          return AddProductProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
