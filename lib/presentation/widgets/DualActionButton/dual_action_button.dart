import 'package:flutter/material.dart';

import '../ActionButton/action_button.dart';

class DualActionButtons extends StatelessWidget {
  final String leftButtonText;
  final VoidCallback onLeftPressed;
  final String rightButtonText;
  final VoidCallback onRightPressed;

  const DualActionButtons({
    super.key,
    required this.leftButtonText,
    required this.onLeftPressed,
    required this.rightButtonText,
    required this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActionButton(
            textColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Colors.transparent,
            borderColor: Theme.of(context).colorScheme.primary,
            onPressed: onLeftPressed,
            text: leftButtonText,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            borderColor: Theme.of(context).colorScheme.primary,
            onPressed: onRightPressed,
            text: rightButtonText,
          ),
        ),
      ],
    );
  }
}
