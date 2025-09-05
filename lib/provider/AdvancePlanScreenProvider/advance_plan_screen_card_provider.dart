import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../routes/app_routes.dart';


class AdvancePlanScreenCardProvider extends ChangeNotifier{
   bool toggleValue = false;
   String description = "50+ creators are already using Advanced for their journey with Unyta. Explore on map and communicate with them.";
  void toggleSwitch() {
    toggleValue = !toggleValue;
    notifyListeners();
  }

  void onTapButton(BuildContext context, String des){
    if(des.contains(description))
      {
        Navigator.pushNamed(context, AppRoutes.profileSetupTabBar);
      }
  }

}