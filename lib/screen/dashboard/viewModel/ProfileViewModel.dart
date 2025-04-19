import 'package:flutter/cupertino.dart';
import 'package:flutter_new/service/ApiService.dart';
import '../model/ProductData.dart';

class ProfileViewModel extends ChangeNotifier{
  List<ProductData> _profileData = [];
  bool _isLoading = false;
  String? _error;

  List<ProductData> get profileList => _profileData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final ApiService apiService = ApiService();

  Future<void> getProfileData() async{
    _isLoading = true;
    _error = null;
    notifyListeners();

    try{
      _profileData = await apiService.fetchProfile();
    }catch(e){
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();

  }
}