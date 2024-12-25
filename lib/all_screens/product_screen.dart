import 'package:flipkart_project/all_models/product_model.dart';
import 'package:flipkart_project/all_screens/add_product_screen.dart';
import 'package:flipkart_project/providers/product_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.loadProduct();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return AddProductScreen();
              },
            ));
            ProductProvider productProvider =
                Provider.of<ProductProvider>(context, listen: false);
            productProvider.loadProduct();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Product Screen'),
        ),
        body: Consumer<ProductProvider>(builder: (context, provider, child) {
          return ListView.builder(
              itemCount: provider.productList.length,
              itemBuilder: (context, index) {
                Product product = provider.productList[index];
                return Card(
                  margin: const EdgeInsets.all(16),
                  child: ListTile(
                    leading: Image.network(
                      product.imgUrl ?? 'placeholder_image_url',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.name),
                    subtitle: Text(product.desc),
                    trailing: Text(product.price.toString()),
                  ),
                );
              });
        }),
      ),
    );
  }
}
