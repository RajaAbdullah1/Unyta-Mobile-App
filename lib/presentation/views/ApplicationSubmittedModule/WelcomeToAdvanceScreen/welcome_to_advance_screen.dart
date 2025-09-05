import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/ActionButton/action_button.dart';

class WelcomeToAdvanceScreen extends StatelessWidget {
  const WelcomeToAdvanceScreen({super.key});

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
                "Welcome to Unyta Advanced",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "You're now a top-tier creator. Start collaborating!",
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
                  Navigator.pushNamed(context, AppRoutes.stepperScreen);
                },
                text: "Complete Your Profile",
              ),
              SizedBox(height: 10),
              ActionButton(
                textColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.bottomNav, arguments: 2);
                },
                text: "Explore Creators on Map",
              ),
              SizedBox(height: 10),
              ActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.bottomNav, arguments: 3);
                },
                text: "Explore Campaigns",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
