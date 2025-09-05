import 'package:flutter/foundation.dart';

class CategoryProvider with ChangeNotifier {
  final List<String> _selectedCategories = [];

  List<String> get selectedCategories => _selectedCategories;

  void toggleCategory(String category) {
    if (_selectedCategories.contains(category)) {
      _selectedCategories.remove(category);
    } else {
      _selectedCategories.add(category);
    }
    notifyListeners();
  }

  void clearSelection() {
    _selectedCategories.clear();
    notifyListeners();
  }

  bool isSelected(String category) {
    return _selectedCategories.contains(category);
  }
}