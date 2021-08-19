import 'package:flutter/material.dart';
import 'package:konek_api/post_result_model.dart';
import 'package:konek_api/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult? postResult;
  User? user;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("API Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((user != null)
                  ? user!.id.toString() + "|" + user!.name.toString() + "|"
                  : 'tidak ada'),
              ElevatedButton(
                  onPressed: () {
                    User.connectToAPI("2").then((value) {
                      user = value;
                      setState(() {});
                    });
                  },
                  child: Text("POST")),
            ],
          ),
        ),
      ),
    );
  }
}
