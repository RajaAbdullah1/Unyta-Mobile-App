import 'package:flutter/material.dart';
import '../../../../routes/app_routes.dart';
import '../../presentation/widgets/ShowDialog/show_dialog.dart';
import '../../presentation/widgets/SwitchAccountBottomSheet/switch_account_bottomsheet.dart';

class MyProfileProvider with ChangeNotifier {
  Future<void> handleAccountOptionTap(BuildContext context, int index) async {
    if (index == 0) {
      Navigator.pushNamed(context, AppRoutes.accountScreen);
    } else if (index == 1) {
      Navigator.pushNamed(context, AppRoutes.communityGuideline);
    } else if (index == 6) {
      Navigator.pushNamed(context, AppRoutes.notificationScreen);
    } else if (index == 3) {
      Navigator.pushNamed(context, AppRoutes.socialMediaLinksScreen);
    } else if (index == 4) {
      Navigator.pushNamed(context, AppRoutes.privacyPolicyScreen);
    } else if (index == 5) {
      Navigator.pushNamed(context, AppRoutes.termsAndConditions);
    } else if (index == 7) {
      Navigator.pushNamed(context, AppRoutes.badgesAndRewardsTabBar);
    }
  }

  Future<void> handleSupportOptionTap(BuildContext context, int index) async {
    if (index == 3) {
      switchAccountBottomSheet(context);
    } else if (index == 0) {
      Navigator.pushNamed(context, AppRoutes.needHelpScreen);
    } else if (index == 4) {
      final result = await showDialogWidget(
        context: context,
        title: "You’re leaving",
        content: "Are you sure you want to logout?",
        yesText: "Logout",
        cancelText: "Cancel",
      );
      if (result == true && context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.roleSelectionScreen,
              (route) => false,
        );
      }
    }
  }
}
