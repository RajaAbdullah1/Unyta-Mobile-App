import 'package:flutter/material.dart';
import 'package:unyta/data/models/InfoSectionParagraphModel/info_section_pararaph.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/ActionButton/action_button.dart';
import '../../../widgets/InfoBulletContainer/info_bullet_container.dart';

class CommunityGuideline extends StatelessWidget {
  final String role;

  const CommunityGuideline({super.key, this.role = "creator"});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Community Guidelines",
        subtitle:
        "Unyta is built on mutual trust and transparency. These guidelines protect both creators and brands to foster successful collaborations.",
        height: size.height * 0.22,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoContainerWithSections(
                imagePath: "assets/images/paper.png",
                sections: [
                  InfoSectionParagraphModel(
                    title: "Audience Authenticity Checks",
                    text:
                    "We ensure that influencers’ audiences are genuine and engaged, helping protect brand reputation and fostering trust between brands and creators.",
                  ),
                  InfoSectionParagraphModel(
                    title: "No Show Policy",
                    text:
                    "If an influencer misses two bookings in a row, they will be unable to book any future experiences for the following month, promoting accountability.",
                  ),
                  InfoSectionParagraphModel(
                    title: "Content Delivery Delays",
                    text:
                    "In the case of two delays in content delivery, influencers will be unable to receive complimentary products for the next month, ensuring timely and reliable content creation.",
                  ),
                  InfoSectionParagraphModel(
                    title: "Brand Non-Compliance",
                    text:
                    "In the case of two delays in content delivery, influencers will be unable to receive complimentary products for the next month, ensuring timely and reliable content creation.",
                  ),
                  InfoSectionParagraphModel(
                    title: "Creator Non-Compliance",
                    text:
                    "If content is not delivered at all for two brand collaborations within a one-month period, the influencer’s membership will be temporarily suspended.",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ActionButton(
                text: role == "creator" ? "Continue to Home" : "Next",
                onPressed: () {
                  if (role == "creator") {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.bottomNav,
                          (route) => false,
                      arguments: 0,
                    );
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.yourBrandIsReadyScreen,
                          (route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
