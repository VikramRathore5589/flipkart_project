import 'package:flipkart_project/all_models/product_model.dart';
import 'package:flipkart_project/all_screens/product_screen.dart';
import 'package:flipkart_project/core(common%20files)/functions.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController desccontroller = TextEditingController();
    TextEditingController imgUrlcontroller = TextEditingController();
    TextEditingController pricecontroller = TextEditingController();
    final help = StorageHelper();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Products'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: namecontroller,
                decoration:
                    const InputDecoration(hintText: 'Enter product Name'),
              ),
              TextField(
                controller: desccontroller,
                maxLines: 3,
                decoration: const InputDecoration(
                    hintText: 'Enter product Description'),
              ),
              TextField(
                controller: imgUrlcontroller,
                decoration:
                    const InputDecoration(hintText: 'Enter product ImgUrl'),
              ),
              TextField(
                controller: pricecontroller,
                decoration:
                    const InputDecoration(hintText: 'Enter product Price'),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  String name = namecontroller.text;
                  String id = const Uuid().v4();
                  String desc = desccontroller.text;
                  String imgurl = imgUrlcontroller.text;
                  if (name.isEmpty || desc.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All fields are required')),
                    );
                    return;
                  }

                  double? price = double.tryParse(pricecontroller.text);
                  if (price == null || price <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter a valid price')),
                    );
                    return;
                  }

                  Product product = Product(
                    id: id,
                    name: name,
                    desc: desc,
                    imgUrl: imgurl.isEmpty
                        ? 'https://dummyimage.com/600x400/000/fff'
                        : imgurl,
                    price: price,
                  );

                  await help.setString(product);

                  ScaffoldMessenger.of( context ).showSnackBar( const SnackBar(
                      content: Text('Product added successfully')));
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const ProductScreen();
                    },
                  ));
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
