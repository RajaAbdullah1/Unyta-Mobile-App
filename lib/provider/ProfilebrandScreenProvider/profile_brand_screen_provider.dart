import 'package:flutter/cupertino.dart';
import 'package:unyta/routes/app_routes.dart';

class ProfileBrandScreenProvider extends ChangeNotifier {
  void continueOnTap(String role, BuildContext context) {
    if (role == "Creator") {
      Navigator.pushNamed(
        context,
        AppRoutes.yourSubscriptionScreen,
        arguments: role,
      );
    } else {
      Navigator.pushNamed(
        context,
        AppRoutes.scaleYourCreatorStrategyScreen,
        arguments: role,
      );
    }
  }
}
