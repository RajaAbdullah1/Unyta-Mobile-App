import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:unyta/routes/app_routes.dart';


class FinalProfileSetupScreenProvider extends ChangeNotifier{

  void onNextOnTap(BuildContext context){
    Navigator.pushNamed(context,AppRoutes.safetyPolicyScreen, arguments: "brand");
  }

}