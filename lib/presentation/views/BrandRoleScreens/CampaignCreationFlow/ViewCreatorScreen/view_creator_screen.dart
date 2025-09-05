import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/ViewCreatorCard/view_creator_card.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../../widgets/ActionButton/action_button.dart';

class ViewCreatorScreen extends StatelessWidget {
  const ViewCreatorScreen({super.key});

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
              CircleAvatar(
                radius: 50,
                child: Image.asset("assets/images/match.png"),),
              SizedBox(height: 20),
              ViewCreatorCard(
                textColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                avatarImagePath: 'assets/images/reviewImage.png',
                creatorName: 'Olivia.jen',
                isVerified: true,
                campaignTitle: '@olivia.jen',
                campaignLocation: 'Manassas, Virginia',
                rating: '4.5',
              ),
              SizedBox(height: 20,),
              ActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.brandSideChatScreen,(route) => false,);
                },
                text: "Chat with Olivia",
              ),
              SizedBox(height: 10),
              ActionButton(
                backgroundColor: Theme.of(context).colorScheme.surfaceBright,
                borderColor: Theme.of(context).colorScheme.primary,
                textColor:Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.profileDetailScreen1,(route) => false, arguments: "brand");
                },
                text: "View Profile",
              )
            ],
          ),
        ),
      ),
    );
  }
}
