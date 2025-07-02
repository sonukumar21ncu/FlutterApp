import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class PostService {
  static Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    print("📡 Fetching posts from: $url");

    try {
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'User-Agent': 'FlutterApp/1.0',
        },
      );

      print("✅ STATUS CODE: ${response.statusCode}");
      print("📦 BODY: ${response.body.substring(0, 100)}...");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print("✅ JSON PARSED: ${jsonData.length} items");
        return (jsonData as List).map((e) => Post.fromJson(e)).toList();
      } else {
        throw Exception("❌ Failed with status: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ EXCEPTION: $e");
      throw Exception('Failed to load posts');
    }
  }
}
