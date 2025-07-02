import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Shareddata.dart';

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shared = Provider.of<SharedData>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Page A')),
      backgroundColor: Colors.lightBlue[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page A', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('Current Message:', style: TextStyle(fontSize: 16)),
            Text(shared.message, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                shared.updateMessage("Updated from Page A");
              },
              child: Text('Update Shared Message'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Go Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
