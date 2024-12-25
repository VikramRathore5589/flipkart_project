import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://your-backend-api.com/api/products";  // Replace with your API URL

  // Method to add a product
  static Future<bool> addProduct({
    required String name,
    required String id,
    required String desc,
    required String imgUrl,
    required double price,
  }) async {
    final url = Uri.parse(baseUrl);  // API endpoint to add product

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json", // Specify content type
        },
        body: jsonEncode({
          'name': name,
          'id': id,
          'description': desc,
          'image_url': imgUrl,
          'price': price,
        }),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, the product is added successfully
        return true;
      } else {
        // If the server returns an error response
        return false;
      }
    } catch (error) {
      print("Error adding product: $error");
      return false;
    }
  }
}
