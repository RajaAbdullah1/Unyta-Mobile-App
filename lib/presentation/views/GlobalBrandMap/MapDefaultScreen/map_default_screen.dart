import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../provider/MapDefaultScreenProvider/map_default_provider.dart';
import '../../../widgets/BuildRadionWithText/build_radio_with_text.dart';
import '../../../widgets/ChooseCategoryBottomSheet/choose_category_bottom_sheet.dart';
import '../../../widgets/HomeAppBar/home_app_bar.dart';
import '../../../widgets/MapHeader/map_header.dart';
import '../../../widgets/SearchWithFilter/search_with_filter.dart';
import '../../../widgets/UpgradeToAdvanceBotomSheet/upgradte_to_advance_bottom_sheet.dart';
import '../../../widgets/UpgradeToAdvanceButton/upgrade_to_advance.dart';

class MapDefaultScreen extends StatefulWidget {
  const MapDefaultScreen({super.key});

  @override
  State<MapDefaultScreen> createState() => _MapDefaultScreenState();
}

class _MapDefaultScreenState extends State<MapDefaultScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HomeAppBar(
        title: "Oliva",
        profileImagePath: "assets/images/Image profile.png",
        onProfileTap: () {},

      ),
      body: Consumer<MapDefaultProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding: AppPaddings.all16,
                child: Column(
                  children: [
                    MapHeader(
                      switchValue: value.toggleLocation,
                      onSwitchChanged: (val) {
                        value.toggleLocationProvider();
                      },
                    ),
                    const SizedBox(height: 10),
                    SearchWithFilter(
                      controller: searchController,
                      hintText: "Search campaigns",
                      onFilterPressed: () {
                        chooseCategory(context);
                        // TODO: open filter bottom sheet
                      },
                    ),
                    const SizedBox(height: 20),
                    UpgradeToAdvancedButton(
                      onTap: () => upgradeToAdvanceBottomSheet(context),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildRadioWithText(context, value, "Both"),
                        buildRadioWithText(context, value, "Creators"),
                        buildRadioWithText(context, value, "Brand"),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: size.height * 0.43,
                child: Image.asset(
                  "assets/images/map_placeholder.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
