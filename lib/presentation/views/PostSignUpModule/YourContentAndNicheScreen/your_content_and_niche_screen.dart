import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../widgets/CategoryGrid/categroy_grid.dart';
import '../../../widgets/DualActionButton/dual_action_button.dart';
import '../../../widgets/TextFieldWidget/text_field_widget.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../provider/StepperScreenProvider/stepper_screen_provider.dart';
import 'package:provider/provider.dart';

class YourContentAndNicheScreen extends StatefulWidget {
  const YourContentAndNicheScreen({super.key});

  @override
  State<YourContentAndNicheScreen> createState() =>
      _YourContentAndNicheScreenState();
}

class _YourContentAndNicheScreenState extends State<YourContentAndNicheScreen> {
  final TextEditingController contentStyleController = TextEditingController();

  @override
  void dispose() {
    contentStyleController.dispose();
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
            "Your Content & Niche",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Help us match you with the right brands",
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
                  CategoryGrid(
                    allowMultipleSelection: true,
                    categories: AppConstants.defaultCategories,
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Describe your content style ",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "(Optional)",
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
                    hintText: "Lifestyle with a focus on minimal...",
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
