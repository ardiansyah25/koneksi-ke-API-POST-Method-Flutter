import 'package:flutter/material.dart';
import 'package:konek_api/post_result_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult? postResult;
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
              Text((postResult != null)
                  ? postResult!.name.toString() +
                      "|" +
                      postResult!.id.toString() +
                      "|"
                  : 'tidak ada'),
              ElevatedButton(
                  onPressed: () {
                    PostResult.connectToAPI("baju", "dokter").then((value) {
                      postResult = value;
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
