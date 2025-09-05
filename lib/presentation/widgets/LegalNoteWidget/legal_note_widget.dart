
import 'package:flutter/material.dart';
import '../../../core/styles/app_border_radius.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_paddings.dart';

Widget legalNoteWidget(BuildContext context) {
  return Container(
    padding: AppPaddings.all16,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.border),
      color: Theme.of(context).colorScheme.surface,
      borderRadius: AppBorderRadius.roundedLarge,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Legal Note",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        _buildRichText(
          context,
          [
            const TextSpan(text: "You can always revisit our "),
            _linkSpan(context, "Safety Policy, Terms of Service "),
            const TextSpan(text: " and "),
            _linkSpan(context, "Privacy Policy"),
            const TextSpan(text: " in your account settings"),
          ],
        ),
        _buildRichText(
          context,
          [
            const TextSpan(text: "Have a concern? "),
            _linkSpan(context, "Contact Support"),
          ],
        ),
      ],
    ),
  );
}

Widget _buildRichText(BuildContext context, List<TextSpan> children) {
  return RichText(
    text: TextSpan(
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSecondary,
        height: 1.5,
      ),
      children: children,
    ),
  );
}

TextSpan _linkSpan(BuildContext context, String text) {
  return TextSpan(
    text: text,
    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
    ),
  );
}