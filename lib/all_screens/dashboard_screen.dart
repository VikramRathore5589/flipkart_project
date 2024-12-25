import 'package:flipkart_project/all_screens/cart_screen.dart';
import 'package:flipkart_project/all_screens/category_screen.dart';
import 'package:flipkart_project/all_screens/category_screen.dart';
import 'package:flipkart_project/all_screens/product_screen.dart';
import 'package:flipkart_project/all_screens/profile_screen.dart';
import 'package:flipkart_project/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List<Widget> screenList = [
    const ProductScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(
      builder: (context,provider,child){
      return Scaffold(
        appBar: AppBar(
          title: const Text('DashBoard Screen'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.production_quantity_limits), label: 'Product'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
          ],
          currentIndex: provider.currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: ( index) {
           DashBoardProvider dashBoardProvider=Provider.of<DashBoardProvider>(context,listen: false);
           dashBoardProvider.changeValue(index);
          },
        ),
        body: screenList[provider.currentIndex],
      );}
    );
  }
}
