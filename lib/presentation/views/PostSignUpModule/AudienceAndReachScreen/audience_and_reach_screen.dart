import 'package:flutter/material.dart';
import '../../../widgets/DropDownWidget/drop_down_widget.dart';
import '../../../widgets/DualActionButton/dual_action_button.dart';
import '../../../widgets/TextFieldWidget/text_field_widget.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../provider/StepperScreenProvider/stepper_screen_provider.dart';
import 'package:provider/provider.dart';

class AudienceAndReachScreen extends StatefulWidget {
  const AudienceAndReachScreen({super.key});

  @override
  State<AudienceAndReachScreen> createState() =>
      _AudienceAndReachScreenScreenState();
}

class _AudienceAndReachScreenScreenState extends State<AudienceAndReachScreen> {
  TextEditingController instagramFollowersController = TextEditingController();
  TextEditingController engagementRateController = TextEditingController();
  TextEditingController primaryLocationController = TextEditingController();

  @override
  void dispose() {
    instagramFollowersController.dispose();
    engagementRateController.dispose();
    primaryLocationController.dispose();
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
          /// 🔹 Sticky Header (won’t scroll)
          Text(
            "Audience & Reach",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "A quick look at your audience",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),

          /// 🔹 Scrollable Body
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: instagramFollowersController,
                    hintText: "Instagram Followers",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    controller: engagementRateController,
                    hintText: "Engagement Rate",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Audience demographics",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    controller: primaryLocationController,
                    hintText: "Primary Location",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 20),
                  DropdownWidget<String>(
                    hintText: "Select Gender",
                    items: const [
                      DropdownMenuItem(value: "Male", child: Text("Male")),
                      DropdownMenuItem(value: "Female", child: Text("Female")),
                      DropdownMenuItem(value: "Other", child: Text("Other")),
                    ],
                    onChanged: (val) {
                      debugPrint("Selected: $val");
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownWidget<String>(
                    hintText: "Select Age Range",
                    items: const [
                      DropdownMenuItem(value: "10-20", child: Text("10 - 20")),
                      DropdownMenuItem(value: "21-30", child: Text("21 - 30")),
                      DropdownMenuItem(value: "31-40", child: Text("31 - 40")),
                      DropdownMenuItem(value: "41-50", child: Text("41 - 50")),
                      DropdownMenuItem(value: "51-60", child: Text("51 - 60")),
                      DropdownMenuItem(value: "61+", child: Text("61+")),
                    ],
                    onChanged: (val) {
                      debugPrint("Selected: $val");
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          /// 🔹 Sticky Bottom Buttons
          DualActionButtons(
            leftButtonText: "Back",
            onLeftPressed: () => provider.prevStep(),
            rightButtonText: "Next",
            onRightPressed: () {
              provider.nextStep(4);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

}
