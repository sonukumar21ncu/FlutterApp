import 'package:flutter/material.dart';

class SharedData with ChangeNotifier {
  String message = "Initial shared message";

  void updateMessage(String newMessage) {
    message = newMessage;
    notifyListeners();
  }
}
