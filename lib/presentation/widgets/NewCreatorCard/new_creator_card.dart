import 'package:flutter/material.dart';
import '../StatusBadge/status_badge.dart';

class CreatorCard extends StatelessWidget {
  final String name;
  final String username;
  final String imagePath;
  final VoidCallback? onTap;
  final bool? isShowDeleteIcon;
  final bool? simpleTile;
  final String? buttonLabel;
  final double? radius;
  final Color? bgColor;
  final double? verticalPadding;

  const CreatorCard({
    super.key,
    required this.name,
    required this.username,
    required this.imagePath,
    this.isShowDeleteIcon,
    this.simpleTile,
    this.buttonLabel,
    this.radius = 25,
    this.onTap,
    this.bgColor,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // thoda rounded look
        ),
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        contentPadding:  EdgeInsets.symmetric(horizontal: 16, vertical: verticalPadding ?? 16),
        leading: CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          username,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: buttonLabel != null
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            StatusBadge(
              onTap: onTap,
              text: buttonLabel ?? "",
              verticalPadding: 4,
              horizontalPadding: 8,
            ),
            if (isShowDeleteIcon == true)
              Row(
                children: [
                  const SizedBox(width: 20),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor:
                    Theme.of(context).colorScheme.surfaceDim,
                    child: Image.asset(
                      "assets/images/delete.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
          ],
        )
            : simpleTile == true
            ? const SizedBox()
            : InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 102,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View Profile",
                  style:
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
