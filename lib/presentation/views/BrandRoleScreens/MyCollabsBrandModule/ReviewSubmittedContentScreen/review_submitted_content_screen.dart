import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import '../../../../../core/styles/app_paddings.dart';
import '../../../../widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../widgets/NewCreatorCard/new_creator_card.dart';
import '../../../../widgets/UploadProofBrandCard/upload_proof_brand_card.dart';

class ReviewSubmittedContentScreen extends StatelessWidget {
  const ReviewSubmittedContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Review Submitted Content",
        subtitle: "View proof submissions, approve content, and reward top creators.",
        height: MediaQuery.of(context).size.height * 0.18,
      ),
      body: ListView(
        padding: AppPaddings.horizontal16,
        children: [
          SizedBox(height: 20,),
          CreatorCard(
            radius: 30,
            name: "Olivia Jen",
            username: "@olivia.style",
            imagePath: "assets/images/match.png",
            onTap: () {
              debugPrint("View Profile clicked for Olivia Jen");
            },
          ),
          SizedBox(height: 20,),
          UploadedProofBrandCard(
            isHideButton: true,
            status: "Pending",
          ),
          SizedBox(height: 10,),
          ...List.generate(2, (index) {
            return UploadedProofBrandCard(
              status: "Under Review",
              caption: "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
            );
          },),
          SizedBox(height: 10,),
          Container(
            color: Theme.of(context).colorScheme.surfaceBright,
            padding: AppPaddings.all16,
            child: ActionButton(
              text: "Close",
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
