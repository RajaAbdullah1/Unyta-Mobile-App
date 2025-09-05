import 'package:flutter/foundation.dart';

class LoginProvider with ChangeNotifier {
  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}