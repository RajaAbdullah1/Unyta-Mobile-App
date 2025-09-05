import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import 'package:unyta/presentation/widgets/TextFieldWidget/text_field_widget.dart';
import '../../../../provider/RatingProvider/rating_provider.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/ActionButton/action_button.dart';

class RateYourBrandPartnerScreen extends StatefulWidget {
  const RateYourBrandPartnerScreen({super.key});

  @override
  State<RateYourBrandPartnerScreen> createState() => _RateYourBrandPartnerScreenState();
}

class _RateYourBrandPartnerScreenState extends State<RateYourBrandPartnerScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3  = TextEditingController();

  @override
  dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Rate Your Brand Partner",
        subtitle:
        "Now that your experience is complete, help other creators discover top brand partners",
        height: size.height * 0.2,
      ),
      body:  Padding(
        padding: AppPaddings.all16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Over Rating", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(height: 12,),
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
            SizedBox(height: 16,),
            Text("What was your experience like? (optional)", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            TextFieldWidget(controller: controller1, hintText: "lifestyle with a focus on minimal...", keyboardType: TextInputType.text, validator: (p0) {
              return null;
            },),
            SizedBox(height: 12,),
            Text("Did the brand communicate clearly? Was the gifting process smooth? (optional)", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            TextFieldWidget(controller: controller2, hintText: "lifestyle with a focus on minimal...", keyboardType: TextInputType.text, validator: (p0) {
              return null;
            },),
            SizedBox(height: 12,),
            Text("Would you collaborate again? (optional)", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            TextFieldWidget(controller: controller3, hintText: "lifestyle with a focus on minimal...", keyboardType: TextInputType.text, validator: (p0) {
              return null;
            },),
            SizedBox(height: 12,),
            Spacer(),
            ActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
              Navigator.pushNamed(context, AppRoutes.reviewSubmittedScreen);
              },
              text: "Submit Review",
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
