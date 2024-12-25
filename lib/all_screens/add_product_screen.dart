import 'package:flipkart_project/all_screens/product_screen.dart';
import 'package:flipkart_project/providers/add_product_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imgUrlController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Products'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Enter product Name'),
                ),
                TextField(
                  controller: descController,
                  maxLines: 3,
                  decoration: const InputDecoration(hintText: 'Enter product Description'),
                ),
                TextField(
                  controller: imgUrlController,
                  decoration: const InputDecoration(hintText: 'Enter product ImgUrl'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(hintText: 'Enter product Price'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: addProduct,
                  child: const Text('Add Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future addProduct() async {
    String name = nameController.text;
    String id = const Uuid().v4();
    String desc = descController.text;
    String imgUrl = imgUrlController.text;

    if (name.isEmpty || desc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required')),
      );
      return;
    }

    double? price = double.tryParse(priceController.text);
    if (price == null || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid price')),
      );
      return;
    }

    // Call the provider to add the product to the API
    AddProductProvider addProductProvider = Provider.of<AddProductProvider>(context, listen: false);
    await addProductProvider.addProduct(name, id, desc, imgUrl, price);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product added successfully')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProductScreen(),
      ),
    );
  }
}
