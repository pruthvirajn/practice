import 'dart:convert';

import 'package:http/http.dart' as http;

class BlogService {
  static Future<bool> deleteById(String id) async {
    // final url = 'https://api.nstack.in/v1/todos/$id';
    final url = 'http://localhost:5000/blogs/$id';
    // http://localhost:5000/blogs/
    // final url = 'http://localhost:5000/blogs/';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return response.statusCode == 200;
  }

  static Future<List?> fetchTodos() async {
    // const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    const url = 'http://localhost:5000/blogs/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = json['data'] as List;
      return result;
    } else {
      return null;
    }
  }

  static Future<bool> updateBlog(String id, Map body) async {
    // final url = 'https://api.nstack.in/v1/todos/$id';
    final url = 'http://localhost:5000/blogs/${id}';

    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 200;
  }

  static Future<bool> addBlog(Map body) async {
    // const url = 'http://api.nstack.in/v1/todos';
    const url = 'http://localhost:5000/blogs/';

    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    return response.statusCode == 201;
  }
}
