import 'package:flipkart_project/all_models/product_model.dart';
import 'package:flipkart_project/all_screens/add_product_screen.dart';
import 'package:flipkart_project/core(common%20files)/functions.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Get get=Get();
  List<Product> productlist = [];

  @override
  void initState() {
    loadproduct();
    super.initState();
  }
Future loadproduct()async{
     productlist= await get.getstring();
     setState(() {

     });
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: ()async {
           await Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return AddProductScreen();
              },
            ));
            loadproduct();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Product Screen'),
        ),
        body: ListView.builder(
            itemCount: productlist.length,
            itemBuilder: (context, index) {
              Product prdct = productlist[index];
              return Card(
                margin: EdgeInsets.all(16),
                child: ListTile(
                  leading: Image.network(prdct.imgUrl??''),
                  title: Text(prdct.name),
                  subtitle: Text(prdct.desc),
                  trailing: Text(prdct.price.toString()),
                ),
              );
            }),
      ),
    );
  }
}
