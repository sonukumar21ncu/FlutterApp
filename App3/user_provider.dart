import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _username = '';

  String get username => _username;

  void setUserName(String name) {
    _username = name;
    notifyListeners();
  }
}
