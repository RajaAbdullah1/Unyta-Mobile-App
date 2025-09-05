import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/AppreciationMessageWidget/appreciation_message_widget.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/ActionButton/action_button.dart';

class ProfileUnderReviewScreen extends StatelessWidget {
  final  String welcomeText;
  const ProfileUnderReviewScreen({super.key, required this.welcomeText});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height : size.height * 0.1),
              Text(
                "Unyta",
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "Welcome, $welcomeText",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Your profile is under review. You will be notified once approved.",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
              SizedBox(height: 20),
              ActionButton(
                textColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Colors.transparent,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.profileApprovedScreen, arguments: welcomeText);
                },
                text: "Log Out",
              ),
              Spacer(),
              appreciationMessage(context),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
