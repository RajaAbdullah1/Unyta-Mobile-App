import 'package:flutter/material.dart';
import '../../../provider/MapDefaultScreenProvider/map_default_provider.dart';
import '../CampaignReviewBottomSheet/campaign_review_bottom_sheet.dart';
import '../ChooseCategoryBottomSheet/choose_category_bottom_sheet.dart';
import '../CreatorBottomSheet/creator_bottom_sheet.dart';

Widget buildRadioWithText(
  BuildContext context,
  MapDefaultProvider provider,
  String label,
) {
  return Row(
    children: [
      Container(
        width: 30,
        height: 20,
        padding: EdgeInsets.zero,
        child: Radio<String>(
          value: label,
          groupValue: provider.selectedValue,
          onChanged: (value) {
            provider.setSelectedValue(value!);
            if (provider.selectedValue == "Creators") {
              creatorBottomSheet(context);
            } else if (provider.selectedValue == "Brand") {

            }else{
              campaignReviewBottomSheet(context);
            }
          },
        ),
      ),
      Text(label, style: Theme.of(context).textTheme.bodyMedium),
    ],
  );
}
