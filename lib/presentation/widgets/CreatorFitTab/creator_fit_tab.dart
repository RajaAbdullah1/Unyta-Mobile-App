
import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/data/repositories/Validation/validation.dart';
import '../../../../provider/StepperScreenProvider/stepper_screen_provider.dart';
import 'package:provider/provider.dart';
import '../DualActionButton/dual_action_button.dart';
import '../TextFieldWidget/text_field_widget.dart';

class CreatorFitTab extends StatefulWidget {
  const CreatorFitTab({super.key});

  @override
  State<CreatorFitTab> createState() => _CreatorFitTabTabState();
}

class _CreatorFitTabTabState extends State<CreatorFitTab> {
  final TextEditingController instagramFollowerController = TextEditingController();
  final TextEditingController otherRequirementController = TextEditingController();

  @override
  void dispose() {
    instagramFollowerController.dispose();
    otherRequirementController.dispose();
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
            "Creator Fit",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Tell us more about your campaign & vision",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField(
                    hint: Text("Fashion" , style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                    items: [
                      DropdownMenuItem(value: "Type1",child: Text("Type1"),),
                      DropdownMenuItem(value: "Type2",child: Text("Type2"),),
                      DropdownMenuItem(value: "Type3",child: Text("Type3"),),
                    ], onChanged: (value) {
                  },),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: instagramFollowerController,
                    hintText: "Minimum Instagram Followers",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    hint: Text("Location Requirement", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                    items: [
                      DropdownMenuItem(value: "Requirement1",child: Text("Requirement1"),),
                      DropdownMenuItem(value: "Requirement2",child: Text("Requirement2"),),
                      DropdownMenuItem(value: "Requirement3",child: Text("Requirement3"),),
                    ], onChanged: (value) {
                  },),
                  const SizedBox(height: 10),
                  Text("What are you gifting?", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)
                    ,),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: otherRequirementController,
                    hintText: "e.g. “must have skincare content in feed”",
                    keyboardType: TextInputType.text,
                    validator: (value) => AppValidation.validateName(value),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          DualActionButtons(
            leftButtonText: "Back",
            onLeftPressed: () => provider.prevStep(),
            rightButtonText: "Next",
            onRightPressed: () {
              provider.nextStep(3);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
