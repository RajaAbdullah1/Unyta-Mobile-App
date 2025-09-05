import 'package:flutter/material.dart';

import '../../../core/styles/app_border_radius.dart';
import '../../../core/styles/app_paddings.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon:  Icon(Icons.info_outline, color: Theme.of(context).colorScheme.surface,),
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.roundedMedium),
      itemBuilder:
          (context) => [
        PopupMenuItem(
          enabled: false,
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                  "How it Works",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 4),
              Text(
                "See what you can do with a Campaign Card",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ),

        // --- Refresh Button ---
        PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                child: Image.asset("assets/images/refresh.png", width: 20),
              ),
              const SizedBox(width: 10),
              Text("Go Back", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
            ],
          ),
        ),

        // --- Reject Button ---
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                child: Image.asset("assets/images/cross.png", width: 20),
              ),
              const SizedBox(width: 10),
              Text("Skip", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
            ],
          ),
        ),

        // --- Accept Button ---
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                child: Image.asset("assets/images/heart.png", width: 20),
              ),
              const SizedBox(width: 10),
              Text("Interested In Collaboration", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 0) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Refresh Selected")));
        } else if (value == 1) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Reject Selected")));
        } else if (value == 2) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Accept Selected")));
        }
      },
    );
  }
}