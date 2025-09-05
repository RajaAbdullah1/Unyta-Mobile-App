// category_grid.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/CategoryGird/category_grid.dart';
import '../BuildTag/build_tag.dart';


class CategoryGrid extends StatelessWidget {
  final List<String> categories;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final bool allowMultipleSelection;

  const CategoryGrid({
    super.key,
    required this.categories,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
    this.childAspectRatio = 2.5,
    this.allowMultipleSelection = true,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: childAspectRatio,
          children: categories.map((category) {
            final isSelected = categoryProvider.isSelected(category);

            return GestureDetector(
              onTap: () {
                if (allowMultipleSelection) {
                  categoryProvider.toggleCategory(category);
                } else {
                  // For single selection, clear all and select one
                  categoryProvider.clearSelection();
                  categoryProvider.toggleCategory(category);
                }
              },
              child: buildTag(
                context,
                category,
                isSelected: isSelected, // Pass selection state to your tag widget
              ),
            );
          }).toList(),
        );
      },
    );
  }
}