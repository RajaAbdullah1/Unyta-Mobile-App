import 'package:flutter/material.dart';

class DropdownProvider<T> extends ChangeNotifier {
  T? _selectedValue;
  bool _isOpen = false;

  T? get selectedValue => _selectedValue;
  bool get isOpen => _isOpen;

  void setValue(T? value) {
    _selectedValue = value;
    _isOpen = false;
    notifyListeners();
  }

  void toggleOpen() {
    _isOpen = !_isOpen;
    notifyListeners();
  }
}
