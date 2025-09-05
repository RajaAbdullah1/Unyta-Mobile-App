import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../../provider/StepperScreenProvider/stepper_screen_provider.dart';
import '../../../../widgets/CampaignOverviewTab/campaign_overview_tab.dart';
import '../../../../widgets/ContentExpectationsTab/content_expectation_tabs.dart';
import '../../../../widgets/CreatorFitTab/creator_fit_tab.dart';
import '../../../../widgets/StepperBar/stepper_bar.dart';

class CampaignStepperScreen extends StatelessWidget {
  const CampaignStepperScreen({super.key});

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
            child: StepperBar(totalSteps: 3, currentStep: stepperProvider.currentStep),
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
        return const CampaignOverviewTab(key: ValueKey(0));
      case 1:
        return const CreatorFitTab(key: ValueKey(1));
      case 2:
        return const ContentExpectationTabs(key: ValueKey(2));
      default:
        return const SizedBox.shrink();
    }
  }
}






