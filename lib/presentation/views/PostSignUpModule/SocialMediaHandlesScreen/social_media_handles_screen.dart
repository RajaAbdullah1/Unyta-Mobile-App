import 'package:flutter/material.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/DualActionButton/dual_action_button.dart';
import '../../../widgets/TextFieldWidget/text_field_widget.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../provider/StepperScreenProvider/stepper_screen_provider.dart';
import 'package:provider/provider.dart';

class SocialMediaHandlesScreen extends StatefulWidget {
  const SocialMediaHandlesScreen({super.key});

  @override
  State<SocialMediaHandlesScreen> createState() =>
      _SocialMediaHandlesScreenState();
}

class _SocialMediaHandlesScreenState extends State<SocialMediaHandlesScreen> {
  final TextEditingController instagramFollowersController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();
  final TextEditingController tiktokController = TextEditingController();

  @override
  void dispose() {
    instagramFollowersController.dispose();
    youtubeController.dispose();
    tiktokController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<StepperScreenProvider>();

    return Padding(
      padding: AppPaddings.horizontal16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Social Media Handles",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Preview brand page and finalize account",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: instagramFollowersController,
                    hintText: "Instagram*",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    controller: youtubeController,
                    hintText: "YouTube (optional)",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    controller: tiktokController,
                    hintText: "TikTok (optional)",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          DualActionButtons(
            leftButtonText: "Back",
            onLeftPressed: () => provider.prevStep(),
            rightButtonText: "Complete My Profile",
            onRightPressed: () {
             Navigator.pushNamedAndRemoveUntil(context, AppRoutes.safetyPolicyScreen, arguments: "creator", (route) => false, );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
