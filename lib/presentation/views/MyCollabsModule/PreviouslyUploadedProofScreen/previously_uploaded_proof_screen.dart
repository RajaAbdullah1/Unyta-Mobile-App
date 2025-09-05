import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import '../../../../core/styles/app_paddings.dart';
import '../../../widgets/CampignBriefCard/campaign_brief_card.dart';
import '../../../widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../widgets/UploadedProofCard/uploaded_proof_carded.dart';

class PreviouslyUploadedProofScreen extends StatelessWidget {
  const PreviouslyUploadedProofScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomTitleAppBar(
          title: "Previously Uploaded Proofs",
          subtitle: "View your proof submissions.",
          height: MediaQuery.of(context).size.height * 0.16,
        ),
      body: ListView(
        padding: AppPaddings.horizontal16,
        children: [
          CampaignBriefCard(
            brandImagePath: "assets/images/reviewImage.png",
            description: "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
            title: "Glow-Up Essentials Gifting Campaign",
          ),
          SizedBox(height: 20,),
          UploadedProofCarded(
            status: "Pending",
          ),
          SizedBox(height: 10,),
          ...List.generate(2, (index) {
            return UploadedProofCarded(
              status: "Under Review",
              caption: "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
            );
          },),
          SizedBox(height: 10,),
          Container(
            color: Theme.of(context).colorScheme.surfaceBright,
            padding: AppPaddings.all16,
            child: ActionButton(
              text: "Cancel",
              onPressed: () {},
              borderColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
