import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/styles/app_paddings.dart';
import '../../../provider/ProfileTabBarProvider/profile_tab_bar_provider.dart';
import '../CategoryGrid/categroy_grid.dart';
import '../DropDownWidget/drop_down_widget.dart';
import '../DualActionButton/dual_action_button.dart';

class AudienceMatchingPreferenceScreen extends StatefulWidget {
  const AudienceMatchingPreferenceScreen({super.key});

  @override
  State<AudienceMatchingPreferenceScreen> createState() =>
      _AudienceMatchingPreferenceScreenState();
}

class _AudienceMatchingPreferenceScreenState
    extends State<AudienceMatchingPreferenceScreen> {
  final TextEditingController contentStyleController = TextEditingController();

  @override
  void dispose() {
    contentStyleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProfileTabBarProvider>();

    return Padding(
      padding: AppPaddings.horizontal16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Audience Matching Preferences",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Help Unyta find your perfect creator match",
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
                  Text(
                    "Preferred Creator Categories",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  CategoryGrid(
                    categories: AppConstants.defaultCategories,
                    allowMultipleSelection: true,
                  ),
                  Text(
                    "Location Preferences",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownWidget(
                    hintTextColor: Theme.of(context).colorScheme.onSecondary,
                    items: [
                      DropdownMenuItem(value: "Usa", child: Text("Usa")),
                      DropdownMenuItem(value: "Canada", child: Text("Canada")),
                      DropdownMenuItem(value: "France", child: Text("France")),
                    ],
                    hintText: "Country/Region",
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Minimum followers",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  CategoryGrid(
                    categories: AppConstants.defaultFollowersList,
                    allowMultipleSelection: true,
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
