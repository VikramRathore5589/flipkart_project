import 'package:flipkart_project/all_models/category_model.dart';
import 'package:flipkart_project/all_screens/category_add_item_screen.dart';
import 'package:flipkart_project/providers/category_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const AddCategoryItem();
              },
            ));
            CategoryProvider categoryProvider =
                Provider.of<CategoryProvider>(context, listen: false);
            categoryProvider.getCategoryList();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Category'),
        ),
        body: Consumer<CategoryProvider>(builder: (context, provider, child) {
          return ListView.builder(
              itemCount: provider.itemList.length,
              itemBuilder: (context, index) {
                CategoryItem itm = provider.itemList[index];
                return GestureDetector(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Are you Sure to delete this item'),
                            actions: [
                              TextButton(onPressed: () {
                                CategoryProvider categoryProvider =
                                Provider.of<CategoryProvider>(context, listen: false);
                                categoryProvider.deleteItm(index);
                                Navigator.pop(context);
                              }, child: const Text('Yes'),),
                              TextButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: const Text('No'),)
                            ],
                          );
                        });

                  },
                  child: Card(
                    margin: const EdgeInsets.all(16),
                    child: ListTile(
                      leading: Image.network(
                        itm.imgUrl ?? 'https://via.placeholder.com/50',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(itm.name),
                    ),
                  ),
                );
              });
        }),
        // body: GridView.builder(
        //   itemCount: itemList.length,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //   ),
        //   itemBuilder: (context, index) {
        //     CategoryItem items = itemList[index];
        //     return GestureDetector(
        //       onLongPress: () {
        //         deleteItm(index);
        //       },
        //       child: ListTile(
        //         leading: Image.network(
        //           items.ImgUrl ?? 'placeholder_image_url',
        //           height: 50,
        //           width: 50,
        //           fit: BoxFit.cover,
        //         ),title: Text(items.name),
        //       ),
        //       // child: Padding(
        //       //   padding: const EdgeInsets.all(8.0),
        //       //   child: Column(
        //       //     children: [
        //       //       ClipRRect(
        //       //         borderRadius: BorderRadius.circular(20),
        //       //         child: Column(
        //       //           children: [
        //       //             Image.network(
        //       //               items.ImgUrl ?? 'placeholder_image_url',
        //       //               height: 50,
        //       //               width: 50,
        //       //               fit: BoxFit.cover,
        //       //             ),
        //       //             Text(items.name),
        //       //           ],
        //       //         ),
        //       //       ),
        //       //     ],
        //       //   ),
        //       // ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
