import 'package:flutter/material.dart';
import '../../data/models/OnboardingPageModel/onboarding_page_module.dart';

class OnboardingScreenProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;
  bool isButtonPressed = false;

  final List<OnboardingPageModel> onboardingPages = [
    OnboardingPageModel(
      imagePath: "assets/images/onboarding1.png",
      title: "Swipe",
      description:
      "Find the perfect match. From top-tier creators to gifted products all tailored to you.",
    ),
    OnboardingPageModel(
      imagePath: "assets/images/onboarding2.png",
      title: "Match",
      description:
      "Chat, share collab ideas, and stay in sync. Every step of the way.",
    ),
    OnboardingPageModel(
      imagePath: "assets/images/onboarding3.png",
      title: "Connect",
      description:
      "Boost visibility, showcase your content, and unlock new opportunities.",
    ),
    OnboardingPageModel(
      imagePath: "assets/images/onboarding4.png",
      title: "Elevate",
      description: "Your vision. Your value. Your terms.",
    ),
  ];

  void setPage(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void nextPage() {
    if (currentIndex < onboardingPages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void buttonPressed(bool pressed) {
    isButtonPressed = pressed;
    notifyListeners();
  }
}
