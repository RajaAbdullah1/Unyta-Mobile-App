import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../../widgets/ActionButton/action_button.dart';

class YourBrandIsReadyScreen extends StatelessWidget {
  const YourBrandIsReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Brand Profile is Set",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Showcase your offers, grow your presence, and match with talented creators.",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
              SizedBox(height: 10),
              ActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.brandBottomNav, (route) => false, arguments: 0);
                },
                text: "Back To Home",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
