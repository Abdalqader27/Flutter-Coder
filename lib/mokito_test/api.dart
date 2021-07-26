import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future fetchFromDatabase(http.Client client) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('exception occured!!!!!!');
    }
  }
}
