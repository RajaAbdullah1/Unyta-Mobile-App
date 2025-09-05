import 'package:flutter/material.dart';

class CustomizeUserExperienceProvider extends ChangeNotifier {
  bool productGifting = false;
  bool experiences = false;
  bool agreeToOffers = false;

  void toggleProductGifting(bool value) {
    productGifting = value;
    notifyListeners();
  }

  void toggleExperiences(bool value) {
    experiences = value;
    notifyListeners();
  }

  void toggleAgreeToOffers(bool value) {
    agreeToOffers = value;
    notifyListeners();
  }
}
