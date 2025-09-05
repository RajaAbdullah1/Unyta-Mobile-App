import 'package:flutter/material.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/LableArrowButton/lable_arrow_button.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.arrow_back)),
        body: SizedBox(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Welcome to Unyta",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Unlock exclusive collaborations. From gifted products and curated experiences to authentic content creation.",
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color:Theme.of(context).colorScheme.onSecondary),
                ),
                SizedBox(height: 20),
                LabelArrowButton(onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.signUpAsBrand, (route) => false ,arguments: "Brand");
                }, text: "I am a Brand",arrowIcon: Icons.arrow_forward_ios, labelAlignment: "start",),
                SizedBox(height: 20),
                LabelArrowButton(onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.signUpAsBrand,(route) => false ,arguments: "Creator");
                }, text: "I am a Creator",arrowIcon: Icons.arrow_forward_ios, labelAlignment: "start",),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.loginScreen, arguments: "Creator");
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
