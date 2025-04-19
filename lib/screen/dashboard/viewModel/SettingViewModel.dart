import 'package:flutter/cupertino.dart';
import 'package:flutter_new/screen/dashboard/model/SettingPhoto.dart';
import 'package:flutter_new/service/ApiService.dart';

import '../model/PhotoResponse.dart';

class SettingViewModel extends ChangeNotifier{
  final ApiService apiService = ApiService();

  SettingPhoto? _settingPhoto;
  bool _isLoading = false;
  String? _error;

  SettingPhoto? get settingPhoto => _settingPhoto;
  bool get isLoading  => _isLoading;
  String? get error => _error;

  Future<void> getSettingData({int offset = 0, int limit = 10}) async{
    _isLoading = true;
    _error = null;
    notifyListeners();

    try{
        _settingPhoto = await apiService.fetchSetting(offset: offset, limit: limit);
    }catch(e){
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

}