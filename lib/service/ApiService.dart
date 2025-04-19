import 'dart:convert';

import 'package:flutter_new/screen/auth/model/LoginResponse.dart';
import 'package:flutter_new/screen/dashboard/model/ProductDetailModel.dart';
import 'package:flutter_new/screen/dashboard/model/SettingPhoto.dart';
import 'package:http/http.dart' as http;
import '../screen/dashboard/model/ProductData.dart';

class ApiService {
  final String baseUrl = "https://dummyjson.com/";

  Future<LoginResponse> LoginInt(
      String username, String password) async {
    try {
      final response = await http.post(Uri.parse("${baseUrl}auth/login"),
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



  Future<List<ProductData>> fetchProfile() async{
    final resposeProfile = await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if(resposeProfile.statusCode == 200){
      List JsonProfile = json.decode(resposeProfile.body);
      return JsonProfile.map((e) => ProductData.fromJson(e)).toList();
    }
    else{
      throw Exception('Failed to load users');
    }
  }

  Future<List<ProductDetailModel>> fetchHomeData() async{
    final responseMobile = await http.get(Uri.parse("https://fakestoreapi.in/api/products?page=2"));

    if(responseMobile.statusCode == 200){
      final data = json.decode(responseMobile.body);

      return (data['products'] as List)
          .map((item) => ProductDetailModel.fromJson(item))
          .toList();

    }else{
      throw Exception('Failed to load users');
    }
  }

  Future<SettingPhoto> fetchSetting({int offset = 0, int limit = 10}) async{
      final response = await http.get(Uri.parse("https://api.slingacademy.com/v1/sample-data/photos"));
      if(response.statusCode == 200){
        final jsonBody = jsonDecode(response.body);
        return SettingPhoto.fromJson(jsonBody);
      }else{
        throw Exception('Failed to load photos');
      }
  }

}
