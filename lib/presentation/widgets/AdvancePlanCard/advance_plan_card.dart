import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import 'package:unyta/presentation/widgets/BulletImageText/bullet_image_text.dart';
import '../../../core/styles/app_border_radius.dart';
import '../../../core/styles/app_paddings.dart';
import '../../../routes/app_routes.dart';
import '../SubscriptionPriceTag/subscription_price_tag.dart';

class AdvancePlanCard extends StatelessWidget {
  final String title;
  final String monthlyPrice;
  final String monthlyPriceSuffix;
  final String yearlyPrice;
  final String yearlyPriceSuffix;
  final String yearlySaveText;
  final List<String> features;

  const AdvancePlanCard({
    super.key,
    required this.title,
    required this.monthlyPrice,
    this.monthlyPriceSuffix = "/month",
    required this.yearlyPrice,
    this.yearlyPriceSuffix = "/yr",
    required this.yearlySaveText,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all16,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
        borderRadius: AppBorderRadius.roundedMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                monthlyPrice,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                monthlyPriceSuffix,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: textCheckRow(feature,context),
          )),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SubscriptionPriceTag(
                  price: yearlyPrice,
                  suffix: yearlyPriceSuffix,
                  saveText: yearlySaveText,
                  priceStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  badgeTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  badgeColor: Theme.of(context).colorScheme.surfaceDim,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Assuming this is defined elsewhere, you might want to move it to this class
  static Widget textCheckRow(String text, BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Colors.green),
        const SizedBox(width: 8),
        Expanded(child: Text(text,    style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSecondary),)),
      ],
    );
  }
}




class AdvancePlanBrandCard extends StatelessWidget {
  final String title;
  final String description;
  final String monthlyPrice;
  final String monthlyPriceSuffix;
  final String yearlyPrice;
  final String yearlyPriceSuffix;
  final String yearlySaveText;
  final bool? showButton;
  final List<String> features;

  const AdvancePlanBrandCard({
    super.key,
    required this.title,
    required this.description,
    required this.monthlyPrice,
    this.monthlyPriceSuffix = "/month",
    required this.yearlyPrice,
    this.yearlyPriceSuffix = "/year",
    required this.yearlySaveText,
    this.showButton,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all16,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
        borderRadius: AppBorderRadius.roundedMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                monthlyPrice,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                monthlyPriceSuffix,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: bulletImageText(context,feature,),
          )),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SubscriptionPriceTag(
                  price: yearlyPrice,
                  suffix: yearlyPriceSuffix,
                  saveText: yearlySaveText,
                  priceStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  badgeTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  badgeColor: Theme.of(context).colorScheme.surfaceDim,
                ),
              ],
            ),
          ),
          if(showButton == true)
          Column(
            children: [
              SizedBox(height: 20),
              ActionButton(text: "Select This Plan", onPressed: () => Navigator.pushNamed(context, AppRoutes.advancePlanScreen),),
            ],
          )
        ],
      ),
    );
  }


}