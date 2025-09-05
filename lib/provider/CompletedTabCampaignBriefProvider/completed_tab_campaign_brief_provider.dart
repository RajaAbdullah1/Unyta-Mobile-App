import 'package:flutter/material.dart';
import '../../presentation/widgets/ShowDialog/show_dialog.dart';


class CampaignDetailsProvider extends ChangeNotifier {
  bool isExpanded = false;

  //******************** View details Toggle Function ********************//
  void toggleDetails() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  //******************** Alert Dialog ********************//
  Future<void> handleDialog(BuildContext context) async {
    final result = await showDialogWidget(
      context: context,
      title: "Delete Campaign",
      content: "Your campaign will be deleted permanently. Are you sure?",
      cancelText: "No",
      yesText: "Yes",
    );
    if (result == true) {
    } else {
      debugPrint("❌ User pressed Cancel");
    }
  }

}
