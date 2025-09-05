import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class SignUpProvider extends ChangeNotifier {
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }



  void onSignup(
    GlobalKey<FormState> formKey,
    BuildContext context,
    String role,
  ) {

    // if (formKey.currentState!.validate()) {
    //   // All validations passed
    //   debugPrint("Signup successful");
    // }
    debugPrint("Signup successful");
    if (role.contains("brand")) {
      Navigator.pushNamed(context, AppRoutes.profileApprovedScreen, arguments:"brand" );
    } else {
      Navigator.pushNamed(context, AppRoutes.profileUnderReviewScreen, arguments: "Creator");
    }
  }
}
