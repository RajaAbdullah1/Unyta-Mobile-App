import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/ActionButton/action_button.dart';
import '../../../widgets/SubscriptionPlanCard/subscription_plan_card.dart';
import '../../../widgets/SubscriptionTile/subscription_tile.dart';

class YourSubscriptionScreen extends StatefulWidget {
  const YourSubscriptionScreen({super.key});

  @override
  State<YourSubscriptionScreen> createState() => _YourSubscriptionScreenState();
}

class _YourSubscriptionScreenState extends State<YourSubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(title: "Your Subscription Plan"),
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: AppPaddings.all16,
          child: ListView(
            children: [
              SubscriptionTile(
                title: "Elevate Your Collabs",
                subtitle: "Boost Your Profile",
                assetPath: "assets/images/subscription.png",
              ),
              SizedBox(height: 20,),
              SubscriptionPlanCard(
                title: "Free Plan",
                description:
                "Enjoy unlimited brand matches and a preview of the map feature, ideal to get started",
                monthlyPrice: "€0.00",
                showYearly: false,
                onChoosePlan: () {
                  debugPrint("Plan Chosen!");
                },
              ),
              SizedBox(height: 10,),
              SubscriptionPlanCard(
                title: "Advanced Plan",
                description:
                "Join unlimited campaigns with premium customer support, and upgrade your map to connect with nearby creators.",
                monthlyPrice: "€0.00",
                yearlyPrice: "€59.99",
                saveText: "Save 17%",
                showYearly: true,
                onChoosePlan: () {
                  debugPrint("Plan Chosen!");
                },
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      bottomSheet:     Padding(
        padding: AppPaddings.all20,
        child: ActionButton( buttonHeight: size.height * 0.06, textColor: Theme.of(context).colorScheme.surface, backgroundColor: Theme.of(context).colorScheme.primary, borderColor: Theme.of(context).colorScheme.primary, onPressed: () {
          Navigator.pushNamed(context, AppRoutes.creatorComparePlan);
        }, text: "Compare Plan", ),
      ),
    );
  }
}
