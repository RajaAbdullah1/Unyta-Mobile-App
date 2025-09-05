import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/styles/app_paddings.dart';
import '../../../data/repositories/Validation/validation.dart';
import '../../../provider/FinalProfileSetupScreenProvider/final_profile_setup_screen_provider.dart';
import '../../../provider/ProfileTabBarProvider/profile_tab_bar_provider.dart';
import '../DualActionButton/dual_action_button.dart';
import '../ShadowCircleButton/shadow_circle_button.dart';
import '../TextFieldWidget/text_field_widget.dart';

class FinalProfileSetupScreen extends StatefulWidget {
  const FinalProfileSetupScreen({super.key});

  @override
  State<FinalProfileSetupScreen> createState() => _FinalProfileSetupScreenState();
}

class _FinalProfileSetupScreenState extends State<FinalProfileSetupScreen> {
  /// Controllers
  final TextEditingController bioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();       // Contact Email
  final TextEditingController instagramController = TextEditingController();   // Instagram
  final TextEditingController websiteController = TextEditingController();     // Website
  final TextEditingController youtubeController = TextEditingController();     // Youtube
  final TextEditingController tiktokController = TextEditingController();      // TikTok

  @override
  void dispose() {
    bioController.dispose();
    emailController.dispose();
    instagramController.dispose();
    websiteController.dispose();
    youtubeController.dispose();
    tiktokController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProfileTabBarProvider>();
    final finalProfileSetupScreenProvider = context.read<FinalProfileSetupScreenProvider>();

    return Padding(
      padding: AppPaddings.horizontal16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Sticky Header
          Text(
            "Brand Preview",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Preview brand page and finalize profile",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(height: 20),

          /// 🔹 Scrollable Body
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/images/reviewImage.png"),
                      ),
                      Positioned(
                        right: 0,
                        child: ShadowCircleButton(
                          icon: Icons.close,
                          radius: 18,
                          onTap: () {
                            debugPrint("Close tapped");
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),

                  TextFieldWidget(
                    controller: bioController,
                    hintText: "Brand Bio",
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    validator: (value) => AppValidation.validateName(value),
                  ),
                  const SizedBox(height: 10),

                  /// 🔹 Contact Email
                  TextFieldWidget(
                    controller: emailController,
                    hintText: "Contact Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => AppValidation.validateEmail(value),
                  ),
                  const SizedBox(height: 10),

                  /// 🔹 Instagram
                  TextFieldWidget(
                    controller: instagramController,
                    hintText: "Instagram *",
                    keyboardType: TextInputType.text,
                    validator: (value) => AppValidation.validateName(value),
                  ),
                  const SizedBox(height: 10),

                  /// 🔹 Website
                  TextFieldWidget(
                    controller: websiteController,
                    hintText: "Website",
                    keyboardType: TextInputType.url,
                    validator: (value) => null, // optional
                  ),
                  const SizedBox(height: 10),

                  /// 🔹 Youtube
                  TextFieldWidget(
                    controller: youtubeController,
                    hintText: "Youtube (Optional)",
                    keyboardType: TextInputType.url,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 10),

                  /// 🔹 TikTok
                  TextFieldWidget(
                    controller: tiktokController,
                    hintText: "TikTok (Optional)",
                    keyboardType: TextInputType.url,
                    validator: (value) => null,
                  ),

                  const SizedBox(height: 100), // 👈 keep last fields visible
                ],
              ),
            ),
          ),
          DualActionButtons(
            leftButtonText: "Back",
            onLeftPressed: () => provider.prevStep(),
            rightButtonText: "Next",
            onRightPressed: ()=> finalProfileSetupScreenProvider.onNextOnTap(context),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
