import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../../provider/ProfileTabBarProvider/profile_tab_bar_provider.dart';
import '../../../../widgets/AudienceMatchingPreferencesTab/audience_matching_preferences_tab.dart';
import '../../../../widgets/FinalProfileSetupTab/final_profile_setup_tab.dart';
import '../../../../widgets/StepperBar/stepper_bar.dart';

class ProfileSetupTabBar extends StatelessWidget {
  const ProfileSetupTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final stepperProvider = context.watch<ProfileTabBarProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final provider = context.read<ProfileTabBarProvider>();

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
            child: StepperBar(totalSteps: 2, currentStep: stepperProvider.currentStep),
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
        return const AudienceMatchingPreferenceScreen(key: ValueKey(0));
      case 1:
        return const FinalProfileSetupScreen(key: ValueKey(1));
      default:
        return const SizedBox.shrink();
    }
  }
}












