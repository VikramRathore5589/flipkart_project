import 'package:flipkart_project/all_screens/cart_screen.dart';
import 'package:flipkart_project/all_screens/category_screen.dart';
import 'package:flipkart_project/all_screens/product_screen.dart';
import 'package:flipkart_project/all_screens/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int currentIndex=0;
  List<Widget> screenList=[
    const ProductScreen(),
    const CartScreen(),
    const CategoryScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DashBoard Screen'),),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits),label: 'Product'),
        BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'Profile'),
      ],currentIndex:currentIndex ,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (int index){
        setState(() {
          currentIndex=index;


        });
        },

      ),body:screenList[currentIndex] ,
    );
  }
}
