import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  String? _userName;
  String? _userProfile;
  bool _isLoggedIn = false;

  String? get userName => _userName;
  String? get userProfile => _userProfile;
  bool get isLoggedIn => _isLoggedIn;

  void setUserInfo({String? userName, String? userProfile, bool isLoggedIn = false}) {
    _userName = userName;
    _userProfile = userProfile;
    _isLoggedIn = true;
    notifyListeners();
  }

  Map<String, dynamic> getUserInfo() {
    return {
      'userName': _userName,
      'userProfile': _userProfile,
      'isLoggedIn': _isLoggedIn,
    };
  }

  void logout() {
    _userName = null;
    _userProfile = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}
