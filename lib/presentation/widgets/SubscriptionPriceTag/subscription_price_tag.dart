import 'package:flutter/material.dart';

class SubscriptionPriceTag extends StatelessWidget {
  final String price;
  final String suffix;
  final String? saveText;
  final TextStyle? priceStyle;
  final TextStyle? suffixStyle;
  final Color? badgeColor;
  final TextStyle? badgeTextStyle;

  const SubscriptionPriceTag({
    super.key,
    required this.price,
    this.suffix = "/yr",
    this.saveText,
    required this.priceStyle,
    required this.suffixStyle,
    this.badgeColor,
    this.badgeTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: price,
            style: priceStyle,
            children: [
              TextSpan(
                text: suffix,
                style: suffixStyle,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        if (saveText != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: badgeColor ?? Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              saveText!,
              style: badgeTextStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodySmall,
            ),
          ),
      ],
    );
  }
}
