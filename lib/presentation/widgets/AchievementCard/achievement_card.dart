import 'package:flutter/material.dart';
import '../IconContainer/icon_container.dart';

class AchievementCard extends StatelessWidget {
  final String assetPath;
  final String progressText;
  final String achievementText;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double? imageSize;
  final Color? borderColor;
  final Color? backgroundColor;
  final bool? showCheckmark;
  final bool? checkValue;

  const AchievementCard({
    super.key,
    required this.assetPath,
    required this.progressText,
    required this.achievementText,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 16,
    this.borderColor,
    this.imageSize,
    this.backgroundColor,
    this.showCheckmark,
    this.checkValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor ?? Theme.of(context).colorScheme.surfaceDim,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconContainer(assetPath: assetPath, size: imageSize ?? 40,),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(progressText,
                        style: Theme.of(context).textTheme.bodyLarge),
                     SizedBox(height:  imageSize != null ? 0 : 8),
                    Text(achievementText,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
              if(showCheckmark == true)
                checkValue == true ? Image.asset("assets/images/check.png", height: 26, width: 26) : Image.asset("assets/images/uncheck.png", height: 26, width: 26),
            ],
          ),
        ),
      ],
    );
  }
}
