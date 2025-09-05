import 'package:flutter/material.dart';
import 'package:unyta/core/constants/app_constants.dart';
import '../ActionButton/action_button.dart';
import '../CategoryGrid/categroy_grid.dart';

void chooseCategory(
    BuildContext context,
    ) {
  String? selectedCategory;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Text(
              "Choose Category",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            CategoryGrid(
              categories: AppConstants.defaultCategories,
              allowMultipleSelection: true,
            ),
            const SizedBox(height: 24),
            ActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                Navigator.pop(context);
              },
              text: "Search",
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
