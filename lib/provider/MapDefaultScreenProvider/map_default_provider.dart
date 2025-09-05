// map_default_provider.dart
import 'package:flutter/foundation.dart';

class MapDefaultProvider with ChangeNotifier {
  bool _toggleLocation = false;
  String _selectedValue = "Both";

  bool get toggleLocation => _toggleLocation;
  String get selectedValue => _selectedValue;

  void toggleLocationProvider() {
    _toggleLocation = !_toggleLocation;
    notifyListeners();
  }

  void setSelectedValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }
}