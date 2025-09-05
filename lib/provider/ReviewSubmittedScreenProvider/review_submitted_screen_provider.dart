import 'package:flutter/material.dart';

class BadgeSelectionProvider extends ChangeNotifier {
  int? _selectedIndex;

  int? get selectedIndex => _selectedIndex;

  void selectBadge(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
