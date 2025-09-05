import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/MyProfileProvider/my_profile_provider.dart';
import '../../../../routes/app_routes.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../widgets/MyProfileListTile/my_profile_list_tile.dart';
import '../../../widgets/ProfileOptionTile/profile_option_tile.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProfileProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        padding: AppPaddings.all16,
        children: [
          ProfileListTile(
            profileImage: 'assets/images/Image profile.png',
            name: 'Olivia Style',
            username: '@Olivia Style',
            onEditTap: () {},
            onShareTap: () {},
            onTap: () => Navigator.pushNamed(context, AppRoutes.editProfileScreen),
          ),
          const SizedBox(height: 20),
          Text(
            "Account",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...List.generate(AppConstants.profileOptions.length, (index) {
            final item = AppConstants.profileOptions[index];
            return ProfileOptionTile(
              iconPath: item.iconPath,
              title: item.title,
              onTap: () => provider.handleAccountOptionTap(context, index),
            );
          }),
          const SizedBox(height: 10),
          Text(
            "Support & Login",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...List.generate(AppConstants.profileOptions2.length, (index) {
            final item = AppConstants.profileOptions2[index];
            return ProfileOptionTile(
              iconPath: item.iconPath,
              title: item.title,
              onTap: () => provider.handleSupportOptionTap(context, index),
            );
          }),
        ],
      ),
    );
  }
}
