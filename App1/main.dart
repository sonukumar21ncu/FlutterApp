//HTTP API CALLS
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'API Demo', home: ApiDemo());
  }
}

class ApiDemo extends StatefulWidget {
  @override
  ApiDemoState createState() => ApiDemoState();
}

class ApiDemoState extends State<ApiDemo> {
  List posts = [];

  void fetchPosts() async {
    final response = await http.get(
      Uri.parse("http://jsonplaceholder.typicode.com/posts"),
    );
    if (response.statusCode == 200) {
      setState(() {
        posts = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API CALL DEMO")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(posts[index]['title']),
          subtitle: Text(posts[index]['body']),
        ),
      ),
    );
  }
}
