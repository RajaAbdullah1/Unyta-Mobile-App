import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../widgets/AdvancePlanCard/advance_plan_card.dart';
import '../../../../widgets/SubscriptionPlanCard/subscription_plan_card.dart';
import '../../../../widgets/SubscriptionTile/subscription_tile.dart';

class ComparePlanScreen extends StatefulWidget {
  const ComparePlanScreen({super.key});

  @override
  State<ComparePlanScreen> createState() => _ComparePlanScreenState();
}

class _ComparePlanScreenState extends State<ComparePlanScreen> {
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
          mainAxisSize: MainAxisSize.min,
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
              height: size.height * 0.6,
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    width: size.width * 1,
                    child: _buildPlanCard(
                      title: "Standard Plan",
                      description:
                      "Ideal for small brands starting with influencer marketing.",
                      bullets: [
                        "1 campaign per month",
                        "Match with up to 30 creators per campaign",
                        "Optional content approval tools",
                      ],
                      monthlyPrice: "€45",
                      yearlyPrice: "€459",
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: size.width * 1,
                    child: AdvancePlanBrandCard(
                      title: "Advance Plan",
                      description: "For growing brands managing multiple campaigns.",
                      monthlyPrice: "€99",
                      yearlyPrice: "1,009",
                      yearlySaveText: "Save 15%",
                      features: [
                        "3 campaigns per month",
                        "Match with up to 90 creators per campaign",
                        "Find nearby creators on the map",
                        "Priority customer support",
                      ],
                      showButton: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String description,
    required List<String> bullets,
    required String monthlyPrice,
    required String yearlyPrice,
  }) {
    return SizedBox(
      width: 300, // fixed width for consistency
      child: SubscriptionPlanCard(
        showSelectPlanButton: true,
        onSelectPlan: () {
          Navigator.pushNamed(context, AppRoutes.advancePlanScreen);
        },
        title: title,
        description: description,
        bulletText: bullets,
        monthlyPrice: monthlyPrice,
        yearlyPrice: yearlyPrice,
        saveText: "Save 15%",
        showYearly: true,
        onChoosePlan: () {

        },
      ),
    );
  }
}
