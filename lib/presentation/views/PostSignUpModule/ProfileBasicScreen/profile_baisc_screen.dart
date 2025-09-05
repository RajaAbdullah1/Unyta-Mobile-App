import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/DualActionButton/dual_action_button.dart';
import '../../../widgets/TextFieldWidget/text_field_widget.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/data/repositories/Validation/validation.dart';
import '../../../../provider/StepperScreenProvider/stepper_screen_provider.dart';
import 'package:provider/provider.dart';

class ProfileBasicScreen extends StatefulWidget {
  const ProfileBasicScreen({super.key});

  @override
  State<ProfileBasicScreen> createState() => _ProfileBasicScreenState();
}

class _ProfileBasicScreenState extends State<ProfileBasicScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryCityController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    emailController.dispose();
    addressController.dispose();
    countryCityController.dispose();
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
          /// 🔹 Sticky Header
          Text(
            "Profile Basics",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Tell us a bit more about yourself",
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
                  Image.asset("assets/images/profile_basic_placeholder.png"),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: nameController,
                    hintText: "Name",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: bioController,
                    hintText: "Bio",
                    maxLines: 5,
                    maxLength: 250,
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: emailController,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => AppValidation.validateEmail(value),
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: addressController,
                    hintText: "Address",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: countryCityController,
                    hintText: "Country & City",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Show my location on Map",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.7,
                        child: CupertinoSwitch(
                          value: true,
                          activeTrackColor:
                          Theme.of(context).colorScheme.onPrimary,
                          inactiveTrackColor:
                          Theme.of(context).colorScheme.surfaceDim,
                          thumbColor: Theme.of(context).colorScheme.primary,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100), // 👈 keep last fields visible
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
              provider.nextStep(3);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
