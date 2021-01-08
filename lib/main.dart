import 'package:flutter/material.dart';
import 'package:flutter_application_1/play.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("Play", style: TextStyle(fontSize: 20)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Play()));
          },
        ),
      ),
    );
  }
}
