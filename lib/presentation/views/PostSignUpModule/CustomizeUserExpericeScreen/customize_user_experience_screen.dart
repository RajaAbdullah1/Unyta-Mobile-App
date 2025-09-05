import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/CustomizeUserExperiencProvider/customize_user_experience_provider.dart';
import '../../../widgets/DualActionButton/dual_action_button.dart';
import '../../../widgets/LableCheckBox/lable_check_box.dart';
import '../../../widgets/TextFieldWidget/text_field_widget.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../provider/StepperScreenProvider/stepper_screen_provider.dart';


class CustomizeUserExperienceScreen extends StatefulWidget {
  const CustomizeUserExperienceScreen({super.key});

  @override
  State<CustomizeUserExperienceScreen> createState() =>
      _CustomizeUserExperienceScreenState();
}

class _CustomizeUserExperienceScreenState extends State<CustomizeUserExperienceScreen> {
  final TextEditingController contentStyleController = TextEditingController();

  @override
  void dispose() {
    contentStyleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stepperProvider = context.read<StepperScreenProvider>();
    final customizeProvider = context.watch<CustomizeUserExperienceProvider>();

    return Padding(
      padding: AppPaddings.horizontal16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customize your experience",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Lets customize your experience",
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
                  const SizedBox(height: 20),
                  Text("What types of collaborations are you open to?",
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),),
                  LabeledCheckbox(
                    label: "Product Gifting",
                    value: customizeProvider.productGifting,
                    onChanged: (val) {
                      customizeProvider.toggleProductGifting(val ?? false);
                    },
                  ),
                  LabeledCheckbox(
                    label: "Experiences",
                    value: customizeProvider.experiences,
                    onChanged: (val) {
                      customizeProvider.toggleExperiences(val ?? false);
                    },
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Any brands or sectors you're especially interested in?",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " (Optional)",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFieldWidget(
                    controller: contentStyleController,
                    hintText: "clean beauty",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          LabeledCheckbox(
            label: "I agree to receive relevant collaboration offers based on my profile",
            value: customizeProvider.agreeToOffers,
            onChanged: (val) {
              customizeProvider.toggleAgreeToOffers(val ?? false);
            },
          ),
          const SizedBox(height: 20),
          DualActionButtons(
            leftButtonText: "Back",
            onLeftPressed: () => stepperProvider.prevStep(),
            rightButtonText: "Next",
            onRightPressed: () {

              stepperProvider.nextStep(5);
            },
          ),
          // DualActionButtons(
          //   leftButtonText: "Back",
          //   onLeftPressed: () => stepperProvider.prevStep(),
          //   rightButtonText: "Next",
          //   onRightPressed: () {
          //     stepperProvider.nextStep(3);
          //   },
          // ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
