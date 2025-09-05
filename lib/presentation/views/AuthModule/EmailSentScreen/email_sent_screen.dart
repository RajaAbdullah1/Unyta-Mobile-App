import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_colors.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import '../../../../routes/app_routes.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back)),
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Check Your Inbox",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "We have sent a secure link to reset your password. If you don’t see it, check your spam folder or try resending the email below",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
              SizedBox(height: 20),
              ActionButton(onPressed: () {
              }, text: "Resend Email",),
              SizedBox(height: 20),
              ActionButton(onPressed: () {
                Navigator.pushNamed(context, AppRoutes.loginScreen);
              }, text: "Back to Login", borderColor: AppColors.primary, backgroundColor: Colors.transparent,textColor: AppColors.primary,),
            ],
          ),
        ),
      ),
    );
  }
}
