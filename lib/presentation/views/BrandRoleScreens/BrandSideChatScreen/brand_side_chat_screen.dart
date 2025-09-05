import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/HomeAppBar/home_app_bar.dart';

import '../../../../core/styles/app_paddings.dart';
import '../../../../routes/app_routes.dart';

class BrandSideChatScreen extends StatelessWidget {
  const BrandSideChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: "skin treats",
        profileImagePath: "assets/images/reviewImage.png",
      ),
      body:
      Padding(
      padding: AppPaddings.all16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Chats",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "Send message to creators",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.chatInboxScreen);
                    },
                    minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    minTileHeight: 0,
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/images/reviewImage.png"),
                    ),
                    title: Text(
                      "Skin Treats",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "This looks fantastic! I love",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    trailing: Text(
                      "Chat",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                },
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(height: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
