import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String? id;
  String? name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(id: object['id'], name: object['firstname']);
  }

  static Future<User> connectToAPI(String id) async {
    var apiURL = Uri.parse("https://reqres.in/api/users/" + id);
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    return User.createUser(userData);
  }
}
