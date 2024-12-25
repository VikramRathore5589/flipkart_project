import 'package:flipkart_project/all_models/product_model.dart';
import 'package:flipkart_project/api_service/product_api_service.dart';
import 'package:flutter/cupertino.dart';

class AddProductProvider extends ChangeNotifier {
  // Function to add product to API
  Future<void> addProduct(
      String id, String name, String desc, String imgUrl, double price) async {

    // Create product object
    Product product = Product(
      id: id,
      name: name,
      desc: desc,
      imgUrl: imgUrl.isEmpty ? 'https://dummyimage.com/600x400/000/fff' : imgUrl,
      price: price,
    );

    // Call the API to add the product
    bool success = await ApiService.addProduct(
      name: product.name,
      id: product.id,
      desc: product.desc,
      imgUrl: product.imgUrl??'',
      price: product.price,
    );

    if (success) {
      // Optionally, you can store the product locally in SharedPreferences here
      // await help.setString(product);
      notifyListeners();
    } else {
      // Handle the error if the product wasn't added successfully
      print("Failed to add product");
    }}
  
  }
// }
// import 'package:flipkart_project/all_screens/product_screen.dart';
// import 'package:flipkart_project/providers/add_product_screen_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:uuid/uuid.dart';
//
// class AddProductScreen extends StatefulWidget {
//   const AddProductScreen({super.key});
//
//   @override
//   @override
//   State<AddProductScreen> createState() => _AddProductScreenState();
// }
//
// class _AddProductScreenState extends State<AddProductScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController descController = TextEditingController();
//   TextEditingController imgUrlController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Add Products'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Card(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration:
//                   const InputDecoration(hintText: 'Enter product Name'),
//                 ),
//                 TextField(
//                   controller: descController,
//                   maxLines: 3,
//                   decoration: const InputDecoration(
//                       hintText: 'Enter product Description'),
//                 ),
//                 TextField(
//                   controller: imgUrlController,
//                   decoration:
//                   const InputDecoration(hintText: 'Enter product ImgUrl'),
//                 ),
//                 TextField(
//                   controller: priceController,
//                   decoration:
//                   const InputDecoration(hintText: 'Enter product Price'),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 ElevatedButton(
//                   onPressed: addProduct,
//                   child: const Text('Add Product'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future addProduct() async {
//     String name = nameController.text;
//     String id = const Uuid().v4();
//     String desc = descController.text;
//     String imgUrl = imgUrlController.text;
//     if (name.isEmpty || desc.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('All fields are required')),
//       );
//       return;
//     }
//     double? price = double.tryParse(priceController.text);
//     if (price == null || price <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a valid price')),
//       );
//       return;
//     }
//
//     AddProductProvider addProductProvider =
//     Provider.of<AddProductProvider>(context, listen: false);
//     addProductProvider.addProduct(name, id, desc, imgUrl, price);
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Product added successfully')),
//     );
//
//     Navigator.push(context, MaterialPageRoute(
//       builder: (context) {
//         return const ProductScreen();
//       },
//     ));
//
//
//
//   }
// // } add product screenclass Product {
// // String id;
// // String name;
// // String desc;
// // String? imgUrl;
// // double price;
// //
// // Product({
// //   required this.id,
// //   required this.name,
// //   required this.desc,
// //   required this.price,
// //   this.imgUrl
// // });
// //
// // Map<String, dynamic> toMap() {
// //   return {
// //     'id': id,
// //     'name': name,
// //     'desc': desc,
// //     'imgUrl': imgUrl,
// //     'price': price
// //   };
// // }
// //
// // static Product fromMap(Map<String, dynamic> map) {
// // return Product(
// // id: map['id'],
// // name: map['name'],
// // desc: map['desc'],
// // imgUrl: map['imgUrl'],
// // price: map['price']);
// // }
// // }
// // model class and   Future<void> setString(Product product) async {
// // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
// // List<String> productList =
// // sharedPreferences.getStringList(_productKey) ?? [];
// // Map<String, dynamic> map = product.toMap();
// // String mapStr = jsonEncode(map);
// // productList.add(mapStr);
// // sharedPreferences.setStringList('product', productList);
// // }
// //
// // Future<List<Product>> getString() async {
// // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
// // List<String> productList =
// // sharedPreferences.getStringList(_productKey) ?? [];
// // List<Product> list = [];
// // for (int i = 0; i < productList.length; i++) {
// // String strMap = productList[i];
// // Map<String, dynamic> map = jsonDecode(strMap);
// // Product product = Product.fromMap(map);
// // list.add(product);
// // }
// // return list;
// // }sharred prefference import 'package:flipkart_project/all_models/product_model.dart';
// // import 'package:flipkart_project/core(common%20files)/functions.dart';
// // import 'package:flutter/cupertino.dart';
// //
// // class AddProductProvider extends ChangeNotifier {
// // final help = StorageHelper();
// //
// // Future<void> addProduct(
// // String id, String name, String desc, String imgUrl, double price) async {
// // Product product = Product(
// // id: id,
// // name: name,
// // desc: desc,
// // imgUrl:
// // imgUrl.isEmpty ? 'https://dummyimage.com/600x400/000/fff' : imgUrl,
// // price: price,
// // );
// //
// // await help.setString(product);
// // notifyListeners();
// // }
// // }