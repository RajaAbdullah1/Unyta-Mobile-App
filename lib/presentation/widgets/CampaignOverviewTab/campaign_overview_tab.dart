import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/data/repositories/Validation/validation.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import '../../../../provider/StepperScreenProvider/stepper_screen_provider.dart';
import 'package:provider/provider.dart';
import '../TextFieldWidget/text_field_widget.dart';

class CampaignOverviewTab extends StatefulWidget {
  const CampaignOverviewTab({super.key});

  @override
  State<CampaignOverviewTab> createState() => _CampaignOverviewTabState();
}

class _CampaignOverviewTabState extends State<CampaignOverviewTab> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController estimatedRetailController = TextEditingController();
  final TextEditingController countryCityController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    desController.dispose();
    productController.dispose();
    estimatedRetailController.dispose();
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
            "Campaign Overview",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Tell us more about your campaign & vision",
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
                  TextFieldWidget(
                    controller: titleController,
                    hintText: "Title",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: desController,
                    hintText: "Description",
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 10),
                  Text("What are you gifting?", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)
                    ,),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    hint: Text("Select Gift",  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                    items: [
                    DropdownMenuItem(value: "Gift1",child: Text("Gift1"),),
                    DropdownMenuItem(value: "Gift2",child: Text("Gift2"),),
                    DropdownMenuItem(value: "Gift3",child: Text("Gift3"),),
                  ], onChanged: (value) {

                  },),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: productController,
                    hintText: "Product Name",
                    keyboardType: TextInputType.text,
                    validator: (value) => AppValidation.validateName(value),
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: estimatedRetailController,
                    hintText: "Estimated Retail Value (optional)",
                    keyboardType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    hint: Text("Shipping Region", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                    items: [
                      DropdownMenuItem(value: "Region1",child: Text("Region1"),),
                      DropdownMenuItem(value: "Region2",child: Text("Region2"),),
                      DropdownMenuItem(value: "Region3",child: Text("Region3"),),
                    ], onChanged: (value) {
                  },),
                  const SizedBox(height: 10),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          ActionButton(text: "Next", onPressed: () {
            provider.nextStep(3);
          },),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
