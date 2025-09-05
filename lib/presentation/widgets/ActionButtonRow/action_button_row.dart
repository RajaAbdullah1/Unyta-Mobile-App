import 'package:flutter/material.dart';

class ActionButtonsRow extends StatelessWidget {
  final List<String> buttonImagePaths;
  final double buttonRadius;
  final double iconSize;
  final Color buttonBackgroundColor;
  final VoidCallback? onRefreshPressed;
  final VoidCallback? onRejectPressed;
  final VoidCallback? onAcceptPressed;

  const ActionButtonsRow({
    super.key,
    this.buttonImagePaths = const [
      'assets/images/refresh.png',
      'assets/images/cross.png',
      'assets/images/heart.png',
    ],
    this.buttonRadius = 25,
    this.iconSize = 24,
    this.buttonBackgroundColor = Colors.white,
    this.onRefreshPressed,
    this.onRejectPressed,
    this.onAcceptPressed,
  });

  @override
  Widget build(BuildContext context) {
    final callbacks = [onRefreshPressed, onRejectPressed, onAcceptPressed];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(buttonImagePaths.length, (index) {
        return GestureDetector(
          onTap: callbacks[index],
          child: CircleAvatar(
            radius: buttonRadius,
            backgroundColor: buttonBackgroundColor,
            child: Image.asset(
              buttonImagePaths[index],
              width: iconSize,
              height: iconSize,
            ),
          ),
        );
      }),
    );
  }
}