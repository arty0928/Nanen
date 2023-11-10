import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  String? _userName;
  String? _userProfile;
  bool _isLoggedIn = false;

  String? get userName => _userName;
  String? get userProfile => _userProfile;
  bool get isLoggedIn => _isLoggedIn;

  int _activeCount = 0;
  int _calmCount = 0;
  int _creativeCount = 0;
  int _peopleCount = 0;

  int get activeCount => _activeCount;
  int get calmCount => _calmCount;
  int get creativeCount => _creativeCount;
  int get peopleCount => _peopleCount;

  void setImageCount({int? activeCount, int? calmCount, int? creativeCount, int? peopleCount}) {
    _activeCount = activeCount ?? 0;
    _calmCount = calmCount ?? 0;
    _creativeCount = creativeCount ?? 0;
    _peopleCount = peopleCount ?? 0;
    notifyListeners();
  }

  Map<String, dynamic> getImageCount() {
    return {
      'activeCount': _activeCount,
      'calmCount': _calmCount,
      'creativeCount': _creativeCount,
      'peopleCount': _peopleCount,
    };
  }

  // 사용자 정보를 설정하고 로그인 여부를 업데이트하는 메서드
  void setUserInfo({String? userName, String? userProfile}) {
    _userName = userName;
    _userProfile = userProfile;
    _isLoggedIn = true;
    notifyListeners();
  }

  // 로그아웃 메서드
  void logout() {
    _userName = null;
    _userProfile = null;
    _isLoggedIn = false;
    notifyListeners();
  }

  Map<String, dynamic> getUserInfo() {
    return {
      'userName': _userName,
      'userProfile': _userProfile,
      'isLoggedIn': _isLoggedIn,
    };
  }
}
