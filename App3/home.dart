import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserProvider>(context).username;

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Text('Welcome, $username!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
