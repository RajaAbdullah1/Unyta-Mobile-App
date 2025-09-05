import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../../provider/CampignStartedScreenProvider/campaign_started_screen_provider.dart';
import '../../../../widgets/ActionButton/action_button.dart';
import '../../../../widgets/NewCreatorCard/new_creator_card.dart';
import '../../../../widgets/SendProductBottomSheet/send_product_bottomSheet.dart';

class CampaignStartedScreen extends StatefulWidget {
  const CampaignStartedScreen({super.key});

  @override
  State<CampaignStartedScreen> createState() => _CampaignStartedScreenState();
}

class _CampaignStartedScreenState extends State<CampaignStartedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<CampaignStartedScreenProvider>(
        context,
        listen: false,
      );
      sendProductBottomSheet(context, () {
        Navigator.pop(context);
        provider.handleDialog(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Campaign Started",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "You are all set, your campaign is live! Time to send your product to the selected creators.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              SizedBox(height: 30),
              CreatorCard(
                name: "Olivia Jen",
                username: "@olivia.style",
                imagePath: "assets/images/match.png",
                onTap: () {
                  debugPrint("View Profile clicked for Olivia Jen");
                },
                buttonLabel: "Shipped",
              ),
              SizedBox(height: 10),
              CreatorCard(
                name: "Olivia Jen",
                username: "@olivia.style",
                imagePath: "assets/images/match.png",
                onTap: () {},
                buttonLabel:
                    "Send"
                    "Product",
              ),
              SizedBox(height: 20),
              ActionButton(
                backgroundColor: Theme.of(context).colorScheme.surfaceBright,
                borderColor: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.primary,
                onPressed: () {},
                text: "Back To Home Page",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
