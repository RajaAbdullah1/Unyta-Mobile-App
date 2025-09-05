import 'package:flutter/material.dart';

class MatchAnimationProvider extends ChangeNotifier {
  late AnimationController heartController;
  late Animation<double> heartAnimation;

  late AnimationController avatarController;
  late Animation<double> avatarAnimation;

  MatchAnimationProvider({required TickerProvider vsync}) {
    // Heart beat animation
    heartController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 800),
    );

    heartAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: heartController, curve: Curves.easeInOut),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        heartController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        heartController.forward();
      }
    });

    heartController.forward();

    // Avatar fade/scale animation
    avatarController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 1200),
    );

    avatarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: avatarController, curve: Curves.elasticOut),
    );

    avatarController.forward();
  }

  void disposeControllers() {
    heartController.dispose();
    avatarController.dispose();
  }
}
