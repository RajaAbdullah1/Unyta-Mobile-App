import 'package:flutter/material.dart';
import '../../../../widgets/BrandCampaignBriefWidgets/brand_campaign_brief_widgets.dart';
import '../../../../widgets/CustomTitleAppBar/custom_title_appbar.dart';

class BrandCampaignBriefScreen extends StatelessWidget {
  const BrandCampaignBriefScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(title: "Campaign Brief", subtitle: "Let’s customize your experience",height: size.height * 0.16,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            campaignDetailsCard(context),
            const SizedBox(height: 20),
            creatorFitCard(context),
            const SizedBox(height: 20),
            contentExpectationsCard(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
