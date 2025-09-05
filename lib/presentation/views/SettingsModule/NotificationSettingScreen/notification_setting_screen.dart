import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/AccountOptionTile/account_option_tile.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Notifications",
        subtitle: "Manage your settings here",
        height: size.height * 0.15,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotificationTile(
                title: "Profile Match",
                value: true,
                onChanged: (newValue) {
                  // handle switch toggle
                },
              ),
              NotificationTile(
                title: "Direct messages",
                value: true,
                onChanged: (newValue) {
                  // handle switch toggle
                },
              ),
              NotificationTile(
                title: "New Campaigns",
                value: true,
                onChanged: (newValue) {
                  // handle switch toggle
                },
              ),
              NotificationTile(
                title: "New Brands",
                value: true,
                onChanged: (newValue) {
                  // handle switch toggle
                },
              ),
              NotificationTile(
                title: "New matches available",
                value: true,
                onChanged: (newValue) {
                  // handle switch toggle
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
