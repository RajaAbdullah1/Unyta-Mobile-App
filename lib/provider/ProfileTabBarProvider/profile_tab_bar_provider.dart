import 'package:flutter/foundation.dart';

class ProfileTabBarProvider extends ChangeNotifier {
  int _currentStep = 0;
  int get currentStep => _currentStep;

  void nextStep(int totalSteps) {
    if (_currentStep < totalSteps - 1) {
      _currentStep++;
      notifyListeners();
    }
  }

  void prevStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }
}