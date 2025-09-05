import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/AccountOptionTile/account_option_tile.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../routes/app_routes.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Account",
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
              AccountOptionTile(
                title: "Change phone number",
                onTap: () {
                  // Handle tap
                },
              ),
              AccountOptionTile(
                title: "Notifications",
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.notificationSettingScreen);
                  // Handle tap
                },
              ),
              AccountOptionTile(
                title: "Manage Subscription",
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.manageSubscriptionScreen);
                },
              ),
              AccountOptionTile(
                title: "Deactivate Account",
                onTap: () {
                  // Handle tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
