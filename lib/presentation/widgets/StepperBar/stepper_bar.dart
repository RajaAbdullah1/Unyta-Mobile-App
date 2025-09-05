/// 🔹 Stepper Bar
import 'package:flutter/material.dart';

class StepperBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const StepperBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        return Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.only(right: index == totalSteps - 1 ? 0 : 6),
            height: 5,
            decoration: BoxDecoration(
              color: index <= currentStep
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }
}



