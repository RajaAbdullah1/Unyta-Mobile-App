import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import 'package:unyta/presentation/widgets/DualActionButton/dual_action_button.dart';

import '../../../../routes/app_routes.dart';
import '../../../widgets/AchievementCard/achievement_card.dart';

class ProofSubmittedScreen extends StatelessWidget {
  const ProofSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Proof Submitted",
        subtitle:
            "Your proof is submitted and is pending review. You’ll be notified once approved.",
        height: size.height * 0.2,
      ),
      body:  Padding(
        padding: AppPaddings.all16,
        child: Column(
          children: [
            AchievementCard(
              padding: AppPaddings.all14,
              showCheckmark: true,
              checkValue: true,
              imageSize: 35,
              assetPath: "assets/images/upload.png",
              progressText: "Creator uploads content file",
              achievementText: "Upload Submitted",
            ),
            SizedBox(height: 20,),
            AchievementCard(
              padding: AppPaddings.all14,
              showCheckmark: true,
              checkValue: true,
              imageSize: 35,
              assetPath: "assets/images/completed_campaigns.png",
              progressText: "Brand confirms collab in Unyta ",
              achievementText: "Marked as Completed",
            ),
            SizedBox(height: 20,),
            AchievementCard(
              padding: AppPaddings.all14,
              showCheckmark: true,
              imageSize: 35,
              assetPath: "assets/images/star_holo.png",
              progressText: "How was your experience with Skin",
              achievementText: "share review (optional)",
            ),
            Spacer(),
            // if first check is true then this button shows otherwise other button please see figma
            // DualActionButtons(leftButtonText: "Back", onLeftPressed: (){}, rightButtonText: "Next", onRightPressed:(){}),// if first check is true then this button shows otherwise other button please see figma

            // if fisrt and second check is true then this button shows instead of above button
            DualActionButtons(leftButtonText: "Next", onLeftPressed: (){}, rightButtonText: "Give Review", onRightPressed: () => Navigator.pushNamed(context, AppRoutes.rateYourBrandPartnerScreen),),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
