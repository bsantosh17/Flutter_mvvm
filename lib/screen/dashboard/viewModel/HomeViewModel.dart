import 'dart:convert';
import 'package:flutter_new/service/ApiService.dart';
import 'package:flutter/material.dart';

import '../model/ProductDetailModel.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<ProductDetailModel>? products;
  bool loading = false;
  String? error;

  Future<void> fetchDataProduct() async {
    loading = true;
    notifyListeners();

    try {
      products = await apiService.fetchHomeData();

    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }


}