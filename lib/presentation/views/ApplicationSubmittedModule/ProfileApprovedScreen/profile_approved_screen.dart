import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../data/repositories/InfoItemRepositories/info_item_repository.dart';
import '../../../../provider/ProfilebrandScreenProvider/profile_brand_screen_provider.dart';
import '../../../widgets/ActionButton/action_button.dart';
import '../../../widgets/InfoSectionWidget/info_section_widget.dart';

class ProfileApprovedScreen extends StatelessWidget {
  final String role;

  const ProfileApprovedScreen({super.key, required this.role});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileBrandScreenProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Unyta",
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: role.contains("Creator") ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                role.contains("Creator") ?  "Welcome, Peter" : "Welcome, Brand",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                textAlign: role.contains("Creator") ? TextAlign.start : TextAlign.center,
                "Your profile has been approved. You’re verified and ready to collaborate!",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              const SizedBox(height: 20),
              InfoSection(
                title: "What you can do...",
                items: InfoItemsRepository.getItemsByRole(role),
              ),
              const Spacer(),
              ActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () => provider.continueOnTap(role, context),
                text: "Continue",
              ),
              const SizedBox(height: 10),
              ActionButton(
                textColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Colors.transparent,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () => Navigator.pop(context),
                text: "Go Back",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
