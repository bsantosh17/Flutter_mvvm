import 'dart:convert';

import 'package:flutter_new/screen/auth/model/LoginResponse.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://dummyjson.com/auth/";

  Future<LoginResponse> LoginInt(
      String username, String password) async {
    try {
      final response = await http.post(Uri.parse("${baseUrl}/login"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{'username': username, 'password': password}));

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      }else{
          return LoginResponse.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw Exception('Login condition not met ${e.toString()}');
    }
  }
}
