import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ApiServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response =
        await client.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie"));
    debugPrint(response.body);
    return (response.statusCode == 200) ? productFromJson(response.body) : null;
  }
}
