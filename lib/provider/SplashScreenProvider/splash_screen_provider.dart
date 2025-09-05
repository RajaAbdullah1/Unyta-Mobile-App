import 'package:flutter/material.dart';

class SplashScreenProvider with ChangeNotifier {
  double _opacity = 0.0;
  double _scale = 0.8;

  double get opacity => _opacity;
  double get scale => _scale;

  void startAnimation() {
    _opacity = 1.0;
    _scale = 1.0;
    notifyListeners();
  }
}
