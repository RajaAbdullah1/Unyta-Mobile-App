import 'package:flutter/material.dart';

class ContentExpectationsProvider extends ChangeNotifier {
  // checkboxes
  bool igReel = false;
  bool igPost = false;
  bool igStory = false;
  bool unboxing = false;
  bool tikTok = false;
  bool privacy = false;

  // counters
  int reelCount = 0;
  int postCount = 0;
  int storyCount = 0;
  int unboxCount = 0;
  int tiktokCount = 0;
  int otherCount = 0;

  // text controllers

  // methods
  void toggleCheckbox(String type, bool value) {
    switch (type) {
      case "reel":
        igReel = value;
        break;
      case "post":
        igPost = value;
        break;
      case "story":
        igStory = value;
        break;
      case "unboxing":
        unboxing = value;
        break;
      case "tiktok":
        tikTok = value;
        break;
      case "privacy":
        privacy = value;
        break;
    }
    notifyListeners();
  }

  void updateCount(String type, int value) {
    if (value < 0) return; // negative na ho
    switch (type) {
      case "reel":
        reelCount = value;
        break;
      case "post":
        postCount = value;
        break;
      case "story":
        storyCount = value;
        break;
      case "unboxing":
        unboxCount = value;
        break;
      case "tiktok":
        tiktokCount = value;
        break;
      case "other":
        otherCount = value;
        break;
    }
    notifyListeners();
  }
}
