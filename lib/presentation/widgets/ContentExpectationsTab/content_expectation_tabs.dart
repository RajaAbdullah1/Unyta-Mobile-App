import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../provider/ContentExpectationsProvider/content_expectation_provider.dart';
import '../../../provider/StepperScreenProvider/stepper_screen_provider.dart';
import '../CounterWidget/counter_widget.dart';
import '../DualActionButton/dual_action_button.dart';
import '../LableCheckBox/lable_check_box.dart';
import '../TextFieldWidget/text_field_widget.dart';

class ContentExpectationTabs extends StatefulWidget {
  const ContentExpectationTabs({super.key});

  @override
  State<ContentExpectationTabs> createState() => _ContentExpectationTabsState();
}

class _ContentExpectationTabsState extends State<ContentExpectationTabs> {
  final TextEditingController otherController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController tagController = TextEditingController();

  dispose() {
    otherController.dispose();
    dateController.dispose();
    tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContentExpectationsProvider>(context);
    final providerStepper = context.read<StepperScreenProvider>();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: AppPaddings.horizontal16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Content Expectations",
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
            child: ListView(
              children: [
                // Sub heading
                Text(
                  "What Types Of Collaborations Are You Open To?",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 16),

                // checkboxes with counters
                _buildRow(context, "IG Reel", provider.igReel, (v) => provider.toggleCheckbox("reel", v!), provider.reelCount,
                        (c) => provider.updateCount("reel", c)),
                _buildRow(context, "IG Post", provider.igPost, (v) => provider.toggleCheckbox("post", v!), provider.postCount,
                        (c) => provider.updateCount("post", c)),
                _buildRow(context, "IG Story", provider.igStory, (v) => provider.toggleCheckbox("story", v!), provider.storyCount,
                        (c) => provider.updateCount("story", c)),
                _buildRow(context, "Unboxing", provider.unboxing, (v) => provider.toggleCheckbox("unboxing", v!), provider.unboxCount,
                        (c) => provider.updateCount("unboxing", c)),
                _buildRow(context, "TikTok", provider.tikTok, (v) => provider.toggleCheckbox("tiktok", v!), provider.tiktokCount,
                        (c) => provider.updateCount("tiktok", c)),

                const SizedBox(height: 16),

                Row(
                  children: [
                    // Other TextField
                    Expanded(
                      child: TextFieldWidget(
                        controller: otherController,
                        hintText: "Other",
                        keyboardType: TextInputType.text,
                        validator: (v) => null,
                        suffixIcon: CounterWidget(
                          count: provider.otherCount,
                          onDecrement: () => provider.updateCount("other", provider.otherCount - 1),
                          onIncrement: () => provider.updateCount("other", provider.otherCount + 1),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 12),
                  ],
                ),
                const SizedBox(height: 16),

                // Deadline field
                TextFieldWidget(
                  controller: dateController,
                  hintText: "DD/MM/YYYY",
                  keyboardType: TextInputType.datetime,
                  validator: (v) => null,
                  readOnly: true,
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      dateController.text = "${picked.day}/${picked.month}/${picked.year}";
                    }
                  },
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Deadline (Optional)",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Required Tag
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Required Tag",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)
                    ),
                    Text(
                        "Add",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextFieldWidget(
                  controller: tagController,
                  hintText: "@tag",
                  keyboardType: TextInputType.text,
                  validator: (v) => null,
                ),
                const SizedBox(height: 20),
                LabeledCheckbox(label: "I confirm that I will provide the agreed offer to all selected creators and meet the campaign expectations", value: provider.privacy, onChanged: (value) {
                  provider.toggleCheckbox("privacy", value!);
                },),
                const SizedBox(height: 8),
              ],
            ),
          ),

          const SizedBox(height: 8),
          DualActionButtons(
            leftButtonText: "Back",
            onLeftPressed: () => providerStepper.prevStep(),
            rightButtonText: "Publish",
            onRightPressed: () {
            Navigator.pushNamed(context, AppRoutes.campaignPublishScreen);
            },
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget _buildRow(
      BuildContext context,
      String label,
      bool value,
      ValueChanged<bool?> onChanged,
      int count,
      Function(int) onCountChanged,
      ) {
    return Row(
      children: [
        Expanded(child: LabeledCheckbox(label: label, value: value, onChanged: onChanged)),
        CounterWidget(
          count: count,
          onDecrement: () => onCountChanged(count - 1),
          onIncrement: () => onCountChanged(count + 1),
        ),
      ],
    );
  }
}
