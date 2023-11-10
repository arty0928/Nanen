import 'package:flutter/material.dart';

class ImageCount extends ChangeNotifier {
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
}
