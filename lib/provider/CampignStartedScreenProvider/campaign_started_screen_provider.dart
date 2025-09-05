import 'package:flutter/cupertino.dart';
import '../../presentation/widgets/ShowDialog/show_dialog.dart';
import '../../routes/app_routes.dart';

class CampaignStartedScreenProvider extends ChangeNotifier {
  Future<void> handleDialog(BuildContext context) async {
    final result = await showDialogWidget(
      context: context,
      title: "Marked as Shipped",
      content: "Your product has been shipped successfully.",
      cancelText: "Close",
      yesText: "Homepage",
    );

    if (!context.mounted) return;
    if (result == true) {
      Navigator.pushNamed(context, AppRoutes.campaignStartedScreen);
    } else {

    }
  }
}
