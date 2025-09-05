import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import 'package:unyta/presentation/widgets/IconContainer/icon_container.dart';
import '../../../widgets/AdvancePlanCard/advance_plan_card.dart';

class ManageSubscriptionScreen extends StatefulWidget {
  const ManageSubscriptionScreen({super.key});

  @override
  State<ManageSubscriptionScreen> createState() =>
      _ManageSubscriptionScreenState();
}

class _ManageSubscriptionScreenState extends State<ManageSubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Manage Subscription",
        height: size.height * 0.15,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AdvancePlanCard(
                title: "Advance Plan",
                monthlyPrice: "€5.99",
                yearlyPrice: "5.99",
                yearlySaveText: "Save 17%",
                features: [
                  "Premium customer support",
                  "Unlimited matches with brands",
                  "Find nearby creators on the map",
                  "Chat directly with any creator and connect beyond brand collabs",
                ],
              ),
              SizedBox(height: 20),
              ListTile(
                minTileHeight: 0,
                contentPadding: AppPaddings.all12,
                leading: IconContainer(assetPath: "assets/images/dollar.png"),
                title: Text(
                  "Next Payment",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Due on Jan 15, 2026",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              Spacer(),
              ActionButton(text: "Change Plan", onPressed: () {}),
              SizedBox(height: 12),
              ActionButton(
                text: "Cancel Membership",
                onPressed: () {},
                borderColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surface,
                textColor: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
