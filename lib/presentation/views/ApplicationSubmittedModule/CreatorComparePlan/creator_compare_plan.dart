import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';

import '../../../../routes/app_routes.dart';
import '../../../widgets/SubscriptionPlanCard/subscription_plan_card.dart';
import '../../../widgets/SubscriptionTile/subscription_tile.dart';

class CreatorComparePlan extends StatefulWidget {
  const CreatorComparePlan({super.key});

  @override
  State<CreatorComparePlan> createState() => _CreatorComparePlanState();
}

class _CreatorComparePlanState extends State<CreatorComparePlan> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;
      _scrollController.jumpTo(screenWidth * 0.3);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomTitleAppBar(title: "Compare Plans"),
      body: Padding(
        padding: AppPaddings.all16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubscriptionTile(
              title: "Select Your Plan",
              subtitle: "The Best Fit For You",
              assetPath: "assets/images/subscription.png",
            ),
            const SizedBox(height: 20),

            // Horizontal Scroll for Plans
            SizedBox(
              height: size.height * 0.3,
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.3,
                    child: SubscriptionPlanCard(
                      title: "Advanced Plan",
                      description:
                      "Join unlimited campaigns with premium customer support, and upgrade your map to connect with nearby creators.",
                      monthlyPrice: "€0.00",
                      yearlyPrice: "€59.99",
                      saveText: "Save 17%",
                      showYearly: true,
                      onChoosePlan: () {
                        Navigator.pushNamed(context, AppRoutes.welcomeToAdvanceScreen);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.3,
                    child:    SubscriptionPlanCard(
                    title: "Advanced Plan",
                    description:
                    "Join unlimited campaigns with premium customer support, and upgrade your map to connect with nearby creators.",
                    monthlyPrice: "€0.00",
                    yearlyPrice: "€59.99",
                    saveText: "Save 17%",
                    showYearly: true,
                    onChoosePlan: () {
                      Navigator.pushNamed(context, AppRoutes.welcomeToAdvanceScreen);
                    },
                  ),)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
