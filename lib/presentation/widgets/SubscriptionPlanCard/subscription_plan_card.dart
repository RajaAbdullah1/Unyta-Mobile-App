import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';

import '../BulletImageText/bullet_image_text.dart';
import '../SubscriptionPriceTag/subscription_price_tag.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final String title;
  final List<String>? bulletText;
  final String description;
  final String monthlyPrice;
  final String monthlySuffix;
  final String? yearlyPrice;
  final String? yearlySuffix;
  final String? saveText;
  final bool showYearly;
  final bool showSelectPlanButton;
  final VoidCallback onChoosePlan;
  final VoidCallback? onSelectPlan;

  const SubscriptionPlanCard({
    super.key,
    required this.title,
    this.bulletText,
    required this.description,
    required this.monthlyPrice,
    this.monthlySuffix = "/month",
    this.yearlyPrice,
    this.yearlySuffix = "/yr",
    this.saveText,
    this.showYearly = true,
    this.showSelectPlanButton = false,
    required this.onChoosePlan,
    this.onSelectPlan,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),

          // ********************* image bullet Text ***************************
          if (bulletText != null) ...[
            SizedBox(height: 10),
            ...List.generate(bulletText!.length, (index) {
              return bulletImageText(context, bulletText![index]);
            }),
            SizedBox(height: 10),
          ],
          // ********************* image bullet Text ***************************

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRichPrice(
                context,
                monthlyPrice,
                monthlySuffix,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.onPrimary,
              ),
              if (showYearly && yearlyPrice != null) ...[
                SubscriptionPriceTag(
                  price: yearlyPrice!,
                  suffix: yearlySuffix ?? "/yr",
                  saveText: saveText,
                  priceStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  badgeColor: Theme.of(context).colorScheme.surfaceDim,
                ),
              ],
            ],
          ),

          //***********************  Choose Plan Button *****************************
          if (bulletText == null)
            Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.06,
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: onChoosePlan,
                    child: const Text("Choose Plan"),
                  ),
                ),
              ],
            ),
          //***********************  Choose Plan Button *****************************

          //***********************  Select Plan Button *****************************
          if(showSelectPlanButton)
          Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: size.height * 0.06,
                width: double.infinity,
                child: ActionButton(text: "Select This Plan", onPressed: onSelectPlan!),
              ),
            ],
          ),
          //***********************  Select Plan Button *****************************
        ],
      ),
    );
  }

  Widget _buildRichPrice(
    BuildContext context,
    String price,
    String suffix,
    Color priceColor,
    Color suffixColor,
  ) {
    return RichText(
      text: TextSpan(
        text: price,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: priceColor,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: suffix,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: suffixColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
