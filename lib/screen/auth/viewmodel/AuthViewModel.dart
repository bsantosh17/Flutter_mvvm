import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/service/ApiService.dart';

class AuthViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> LoginIntegration(
      BuildContext context, String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await apiService.LoginInt(username, password);
      if (response.accessToken != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Login Successful... ${response.accessToken}")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.message.toString())));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Server Error...")));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
