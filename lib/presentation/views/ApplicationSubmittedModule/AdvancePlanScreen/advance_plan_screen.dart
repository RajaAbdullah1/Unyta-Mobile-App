import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../provider/AdvancePlanScreenProvider/advance_plan_screen_card_provider.dart';
import '../../../widgets/ActionButton/action_button.dart';
import '../../../widgets/AdvancePlanCard/advance_plan_card.dart';
import '../../../widgets/AlreadyAdvanceSubsciptionCard/already_advance_subscription_card.dart';

class AdvancePlanScreen extends StatefulWidget {
  final String alreadyCardDes;
  const AdvancePlanScreen({
    super.key,
    this.alreadyCardDes =
        "50+ creators are already using Advanced for their journey with Unyta. Explore on map and communicate with them.",
  });

  @override
  State<AdvancePlanScreen> createState() => _AdvancePlanScreenState();
}

class _AdvancePlanScreenState extends State<AdvancePlanScreen> {
  String description =
      "50+ creators are already using Advanced for their journey with Unyta. Explore on map and communicate with them.";
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdvancePlanScreenCardProvider>(
      context,
      listen: false,
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "You Selected: Advanced Plan",
        height: 120,
      ),
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: AppPaddings.all16,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Annual",
                        style: Theme.of(context).textTheme.titleLarge!,
                      ),
                      Consumer<AdvancePlanScreenCardProvider>(
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: 0.7,
                            child: CupertinoSwitch(
                              value: value.toggleValue,
                              activeTrackColor:
                                  Theme.of(context)
                                      .colorScheme
                                      .onPrimary, // Track color when ON
                              inactiveTrackColor:
                                  Theme.of(context)
                                      .colorScheme
                                      .surfaceDim, // Track color when OFF
                              thumbColor: Theme.of(context).colorScheme.primary,
                              onChanged: (va) {
                                value.toggleSwitch();
                                // Thumb color
                              },
                            ),
                          );
                        },
                      ),
                      Text(
                        "Monthly",
                        style: Theme.of(context).textTheme.titleLarge!,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "€5.99/month or €59.99/year (save 17%)",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (widget.alreadyCardDes.contains(description)) ...[
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
              ] else ...[
                AdvancePlanBrandCard(
                  title: "Advance Plan",
                  description:
                      "For growing brands managing multiple campaigns.",
                  monthlyPrice: "€99",
                  yearlyPrice: "1,009",
                  yearlySaveText: "Save 15%",
                  features: [
                    "3 campaigns per month",
                    "Match with up to 90 creators per campaign",
                    "Find nearby creators on the map",
                    "Priority customer support",
                  ],
                ),
              ],
              SizedBox(height: 20),
              AlreadyAdvanceSubscriptionCard(
                iconPath: "assets/images/explore.png",
                title: "Creators already using Advanced",
                description: widget.alreadyCardDes,
                actionText: "View on Map",
                actionIcon: Icons.arrow_forward,
                onActionTap: () {
                  debugPrint("View on Map tapped");
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: AppPaddings.all20,
        child: ActionButton(
          buttonHeight: size.height * 0.06,
          textColor: Theme.of(context).colorScheme.surface,
          backgroundColor: Theme.of(context).colorScheme.primary,
          borderColor: Theme.of(context).colorScheme.primary,
          onPressed: () => provider.onTapButton(context, description),
          text: "Confirm & Subscribe",
        ),
      ),
    );
  }

  Widget textCheckRow(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.checkmark_alt_circle_fill,
          color: Theme.of(context).colorScheme.onSecondaryFixed,
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
