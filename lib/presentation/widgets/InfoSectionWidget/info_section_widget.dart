import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';
import '../../../core/styles/app_colors.dart';
import '../../../data/models/InfoIItemsModel/info_items_model.dart';
import '../IconTextRow/icon_text_row.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<InfoItem> items;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color borderColor;

  const InfoSection({
    super.key,
    required this.title,
    required this.items,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor = Colors.white,
    this.borderColor = AppColors.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        color: backgroundColor,
        borderRadius: AppBorderRadius.roundedLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Generate item widgets dynamically
          Column(
            children: List.generate(items.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: index == items.length - 1 ? 0 : 12),
                child: iconTextRow(
                  context,
                  items[index].iconPath,
                  items[index].title,
                  items[index].description,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}