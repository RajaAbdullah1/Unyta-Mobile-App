import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int count;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const CounterWidget({
    super.key,
    required this.count,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: (count > 0) ? onDecrement : null,
        ),
        Text(
          count.toString(),
          style: textTheme.titleMedium,
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: onIncrement,
        ),
      ],
    );
  }
}
