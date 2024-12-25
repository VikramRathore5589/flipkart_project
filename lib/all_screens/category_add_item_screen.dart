import 'package:flipkart_project/all_models/category_model.dart';
import 'package:flipkart_project/all_screens/category_screen.dart';
import 'package:flipkart_project/core(common%20files)/functions.dart';
import 'package:flutter/material.dart';

class AddCategoryItem extends StatefulWidget {
  const AddCategoryItem({super.key});

  @override
  State<AddCategoryItem> createState() => _AddCategoryItemState();
}

class _AddCategoryItemState extends State<AddCategoryItem> {
  final nameController = TextEditingController();

  final imageController = TextEditingController();
  StorageHelper storageHelper = StorageHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [Text(' Add Category below'), Icon(Icons.arrow_drop_down)],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Category Name',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: imageController,
                decoration: const InputDecoration(
                  hintText: 'Enter Category Image',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: _saveCategoryList,
                child: const Text('Add Category'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _saveCategoryList() async {
    String name = nameController.text;
    String imgUrl = imageController.text;
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Fields are required'),
        ),
      );
    }
    CategoryItem categoryItem = CategoryItem(
      name: name,
      imgUrl:
          imgUrl.isEmpty ? 'https://dummyimage.com/600x400/000/fff' : imgUrl,
    );
    storageHelper.setCategoryList(categoryItem);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Category Added successfully'),
      ),
    );
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const CategoryScreen();
      },
    ));
  }
}
