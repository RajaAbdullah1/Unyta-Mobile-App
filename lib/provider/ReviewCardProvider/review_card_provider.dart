import 'package:flutter/foundation.dart';

class ReviewCardProvider extends ChangeNotifier {
  int? expandedIndex;

  void toggleExpand(int index) {
    if (expandedIndex == index) {
      expandedIndex = null;
    } else {
      expandedIndex = index;
    }
    notifyListeners();
  }
}
