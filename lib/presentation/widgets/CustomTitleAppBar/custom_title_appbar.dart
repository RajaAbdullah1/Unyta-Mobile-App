import 'package:flutter/material.dart';

class CustomTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onBack;
  final double height;
  final String? actionImagePath; // 🔹 Optional action image
  final VoidCallback? onAction;  // 🔹 Optional action callback

  const CustomTitleAppBar({
    Key? key,
    required this.title,
    this.subtitle,
    this.onBack,
    this.height = 100,
    this.actionImagePath,
    this.onAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        color: Theme.of(context).appBarTheme.backgroundColor ??
            Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Stack(
          children: [
            /// Back Button
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                padding: EdgeInsets.zero,
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.zero),
                ),
                constraints: const BoxConstraints(),
                onPressed: onBack ?? () => Navigator.pop(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            /// 🔹 Optional Action Button (top-right)
            if (actionImagePath != null)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: onAction,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Image.asset(
                    actionImagePath!,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
