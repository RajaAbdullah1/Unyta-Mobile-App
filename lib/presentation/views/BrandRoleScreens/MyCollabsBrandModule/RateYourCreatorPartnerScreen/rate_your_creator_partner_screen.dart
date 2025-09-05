import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import 'package:unyta/presentation/widgets/TextFieldWidget/text_field_widget.dart';
import '../../../../../provider/RatingProvider/rating_provider.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../widgets/ActionButton/action_button.dart';

class RateYourCreatorPartnerScreen extends StatefulWidget {
  const RateYourCreatorPartnerScreen({super.key});

  @override
  State<RateYourCreatorPartnerScreen> createState() =>
      _RateYourCreatorPartnerScreenState();
}

class _RateYourCreatorPartnerScreenState
    extends State<RateYourCreatorPartnerScreen> {
  TextEditingController creatorNameController = TextEditingController();
  TextEditingController campaignTitleController = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  @override
  dispose() {
    controller1.dispose();
    creatorNameController.dispose();
    campaignTitleController.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Rate Your Creator Partner",
        subtitle:
            "Share your feedback to help us uphold a trusted and high-quality creator community.",
        height: size.height * 0.2,
      ),
      body: ListView(
        padding: AppPaddings.all16,
        children: [
          TextFieldWidget(
            controller: creatorNameController,
            hintText:
            "Creator Name",
            keyboardType: TextInputType.text,
            validator: (p0) {
              return null;
            },
          ),
          SizedBox(height: 12),
          TextFieldWidget(
            controller: campaignTitleController,
            hintText:
            "Campaign Title",
            keyboardType: TextInputType.text,
            validator: (p0) {
              return null;
            },
          ),
          SizedBox(height: 12),
          Text(
            "Over Rating",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Consumer<RatingProvider>(
            builder: (context, ratingProvider, _) {
              return Row(
                children: List.generate(5, (index) {
                  int starIndex = index + 1;
                  return GestureDetector(
                    onTap: () {
                      ratingProvider.setRating(starIndex);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        ratingProvider.rating >= starIndex
                            ? "assets/images/star.png"
                            : "assets/images/star_holo.png",
                        height: 40,
                        width: 40,
                        color: Colors.amberAccent,
                      ),
                    ),
                  );
                }),
              );
            },
          ),
          SizedBox(height: 16),
          Text(
            "How did the collaboration go? (Optional)",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextFieldWidget(
            controller: controller1,
            hintText:
                "The collab went really well! The creator understood the brief and the content aligned with our brand...",
            keyboardType: TextInputType.text,
            maxLines: 3,
            validator: (p0) {
              return null;
            },
          ),
          SizedBox(height: 12),
          Text(
            "Was the content high-quality and delivered on time? (Optional)",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextFieldWidget(
            controller: controller2,
            hintText:
                "Yes the content was beautifully shot, and delivered even earlier...",
            maxLines: 2,
            keyboardType: TextInputType.text,
            validator: (p0) {
              return null;
            },
          ),
          SizedBox(height: 12),
          Text(
            "Was communication professional? (Optional)",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextFieldWidget(
            controller: controller3,
            hintText:
                "Very professional and friendly, she responded quickly and kept us updated...",
            keyboardType: TextInputType.text,
            maxLines: 2,
            validator: (p0) {
              return null;
            },
          ),
          SizedBox(height: 12),
          Spacer(),
          SizedBox(height: 12),
          ActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            borderColor: Theme.of(context).colorScheme.primary,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.brandRatingSubmittedScreen);
            },
            text: "Submit Review",
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
