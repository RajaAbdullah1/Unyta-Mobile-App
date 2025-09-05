import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/NotificationCard/notification_card.dart';

import '../../widgets/CustomTitleAppBar/custom_title_appbar.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Notifications",
        height: size.height * 0.15,
        subtitle:
        "Manage your notifications here",
      ),
      body: ListView(
        padding: AppPaddings.all16,
        children: [
          Text("RECENT", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
          SizedBox(height: 20,),
          ...List.generate(2, (index) {
            return NotificationCard(
              imagePath: "assets/images/reviewImage.png",
              title: "Skin Treats",
              subtitle: "Congrats! Your proof for ‘GlowSkin’ has been approved. Your badge has been updated.",
              time: "45s",
              onTap: () {
                // handle tap
              },
            );
          },),

          Text("Last 7 Days", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
          SizedBox(height: 20,),
          ...List.generate(2, (index) {
            return NotificationCard(
              imagePath: "assets/images/reviewImage.png",
              title: "Skin Treats",
              subtitle: "Congrats! Your proof for ‘GlowSkin’ has been approved. Your badge has been updated.",
              time: "45s",
              onTap: () {
                // handle tap
              },
            );
          },),
        ],
      ),
    );
  }
}
