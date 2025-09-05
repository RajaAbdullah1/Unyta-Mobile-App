import 'package:flutter/foundation.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int i) {
    if (i == _currentIndex) return;
    _currentIndex = i;
    print("index is $_currentIndex");
    notifyListeners();
  }
}