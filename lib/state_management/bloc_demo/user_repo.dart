import 'dart:convert';

import 'package:calendar_app/state_management/bloc_demo/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {

  Future<List<User>> getUserList() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final result = json.decode(response.body).cast<Map<String, dynamic>>().map<User>((json) {
        return User.fromJson(json);
      }).toList();
      return result;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load user list');
    }
  }
}