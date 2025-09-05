import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../provider/StepperScreenProvider/stepper_screen_provider.dart';
import '../../../widgets/StepperBar/stepper_bar.dart';
import '../AudienceAndReachScreen/audience_and_reach_screen.dart';
import '../CustomizeUserExpericeScreen/customize_user_experience_screen.dart';
import '../ProfileBasicScreen/profile_baisc_screen.dart';
import '../SocialMediaHandlesScreen/social_media_handles_screen.dart';
import '../YourContentAndNicheScreen/your_content_and_niche_screen.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {

  @override
  void initState() {
    super.initState();
    final stepperProvider = context.read<StepperScreenProvider>();
    stepperProvider.resetProvider();
  }

  @override
  Widget build(BuildContext context) {
    final stepperProvider = context.watch<StepperScreenProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final provider = context.read<StepperScreenProvider>();

            if (provider.currentStep > 0) {
              provider.prevStep();
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: AppPaddings.horizontal16,
            child: StepperBar(totalSteps: 5, currentStep: stepperProvider.currentStep),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(1.0, 0.0), // Slide in from right
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ));
                return SlideTransition(
                  position: offsetAnimation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: _buildStep(stepperProvider.currentStep),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(int step) {
    switch (step) {
      case 0:
        return const ProfileBasicScreen(key: ValueKey(0));
      case 1:
        return const YourContentAndNicheScreen(key: ValueKey(1));
      case 2:
        return const AudienceAndReachScreen(key: ValueKey(2));
      case 3:
        return const CustomizeUserExperienceScreen(key: ValueKey(3));
      case 4:
        return const SocialMediaHandlesScreen(key: ValueKey(3));
      default:
        return const SizedBox.shrink();
    }
  }
}






