import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../widgets/ActionButton/action_button.dart';

class BrandRatingSubmittedScreen extends StatelessWidget {
  const BrandRatingSubmittedScreen({super.key});

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
                "Review Submitted",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Thank you! Your review helps maintain a high-quality creator community",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
              SizedBox(height: 20),
              ActionButton(
                backgroundColor: Theme.of(context).colorScheme.surfaceBright,
                borderColor: Theme.of(context).colorScheme.primary,
                textColor:Theme.of(context).colorScheme.primary,
                onPressed: () {},
                text: "Back To Home",
              )
            ],
          ),
        ),
      ),
    );
  }
}
