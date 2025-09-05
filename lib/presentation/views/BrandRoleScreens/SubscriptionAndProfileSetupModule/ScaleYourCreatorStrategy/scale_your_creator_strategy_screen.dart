import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../../widgets/ActionButton/action_button.dart';
import '../../../../widgets/SubscriptionPlanCard/subscription_plan_card.dart';
import '../../../../widgets/SubscriptionTile/subscription_tile.dart';

class ScaleYourCreatorStrategyScreen extends StatelessWidget {
  const ScaleYourCreatorStrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(title: "Select Your Subscription Plan"),
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: AppPaddings.all16,
          child: ListView(
            children: [
              //bullet_star.png
              SubscriptionTile(
                title: "Elevate Your Collabs",
                subtitle: "Boost Your Profile",
                assetPath: "assets/images/subscription.png",
              ),
              SizedBox(height: 20),
              SubscriptionPlanCard(
                title: "Free Demo",
                bulletText: [
                  "Limited access (up to 2 creator collaborations)",
                  "Basic campaign creation",
                ],
                description:
                    "Perfect for first-time users to explore the platform.",
                monthlyPrice: "€0.00",
                showYearly: false,
                onChoosePlan: () {
                  debugPrint("Plan Chosen!");
                },
              ),
              SizedBox(height: 10),
              SubscriptionPlanCard(
                title: "Standard Plan",
                description:
                    "Ideal for small brands starting with influencer marketing.",
                bulletText: [
                  "1 campaign per month",
                  "Match with up to 30 creators per campaign",
                  "Optional content approval tools",
                ],
                monthlyPrice: "€45",
                yearlyPrice: "€459",
                saveText: "Save 15%",
                showYearly: true,
                onChoosePlan: () {
                  debugPrint("Plan Chosen!");
                },
              ),
              SizedBox(height: 10),
              SubscriptionPlanCard(
                title: "Advanced Plan",
                description: "For growing brands managing multiple campaigns.",
                bulletText: [
                  "3 campaigns per month",
                  "Match with up to 90 creators per campaign",
                  "Priority customer support",
                ],
                monthlyPrice: "€99",
                yearlyPrice: "€1,009",
                saveText: "Save 15%",
                showYearly: true,
                onChoosePlan: () {
                  debugPrint("Plan Chosen!");
                },
              ),
              SizedBox(height: 10),
              SubscriptionPlanCard(
                title: "Premium Plan",
                description:
                    "Best for brands running large-scale or ongoing influencer activations.",
                bulletText: [
                  "Unlimited campaigns per month",
                  "Unlimited creator matches and gifting",
                  "Priority customer support",
                  "Early access to new content creators",
                ],
                monthlyPrice: "€189",
                yearlyPrice: "€1,928",
                saveText: "Save 15%",
                showYearly: true,
                onChoosePlan: () {
                  debugPrint("Plan Chosen!");
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: AppPaddings.all20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ActionButton(
              buttonHeight: size.height * 0.06,
              textColor: Theme.of(context).colorScheme.surface,
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.comparePlanScreen);
              },
              text: "Compare Plan",
            ),
            SizedBox(height: 10),
            ActionButton(
              buttonHeight: size.height * 0.06,
              textColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Theme.of(context).colorScheme.surfaceBright,
              borderColor: Theme.of(context).colorScheme.primary,
              onPressed: () {},
              text: "View Benefits",
            ),
          ],
        ),
      ),
    );
  }
}
