import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unyta/provider/CompletedTabCampaignBriefProvider/completed_tab_campaign_brief_provider.dart';
import 'package:unyta/provider/RatingProvider/rating_provider.dart';
import 'package:unyta/provider/ReviewCardProvider/review_card_provider.dart';
import 'package:unyta/provider/ReviewSubmittedScreenProvider/review_submitted_screen_provider.dart';
import '../AdvancePlanScreenProvider/advance_plan_screen_card_provider.dart';
import '../BottomNavProvider/bottom_nav_provider.dart';
import '../CampignStartedScreenProvider/campaign_started_screen_provider.dart';
import '../CategoryGird/category_grid.dart';
import '../ContentExpectationsProvider/content_expectation_provider.dart';
import '../CreatorSelectedProvider/creator_selected_provider.dart';
import '../CustomizeUserExperiencProvider/customize_user_experience_provider.dart';
import '../DropDownProvider/drop_down_provider.dart';
import '../FinalProfileSetupScreenProvider/final_profile_setup_screen_provider.dart';
import '../LoginProvider/login_provider.dart';
import '../MapDefaultScreenProvider/map_default_provider.dart';
import '../MyProfileProvider/my_profile_provider.dart';
import '../OnboardingScreenProvider/onboarding_screen_provider.dart';
import '../ProfileTabBarProvider/profile_tab_bar_provider.dart';
import '../ProfilebrandScreenProvider/profile_brand_screen_provider.dart';
import '../SignUpProvider/sign_up_provider.dart';
import '../SplashScreenProvider/splash_screen_provider.dart';
import '../StepperScreenProvider/stepper_screen_provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> providers(BuildContext context) {
    return [
      ChangeNotifierProvider<SplashScreenProvider>(
        create: (context) => SplashScreenProvider(),
      ),
      ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(),
      ),
      ChangeNotifierProvider<SignUpProvider>(
        create: (context) => SignUpProvider(),
      ),
      ChangeNotifierProvider<CampaignStartedScreenProvider>(
        create: (context) => CampaignStartedScreenProvider(),
      ),
      ChangeNotifierProvider<CreatorSelectedProvider>(
        create: (context) => CreatorSelectedProvider(),
      ),
      ChangeNotifierProvider<ContentExpectationsProvider>(
        create: (context) => ContentExpectationsProvider(),
      ),
      ChangeNotifierProvider<ReviewCardProvider>(
        create: (context) => ReviewCardProvider(),
      ),
      ChangeNotifierProvider<FinalProfileSetupScreenProvider>(
        create: (context) => FinalProfileSetupScreenProvider(),
      ),
      ChangeNotifierProvider<ProfileTabBarProvider>(
        create: (context) => ProfileTabBarProvider(),
      ),
      ChangeNotifierProvider<AdvancePlanScreenCardProvider>(
        create: (context) => AdvancePlanScreenCardProvider(),
      ),
      ChangeNotifierProvider<ProfileBrandScreenProvider>(
        create: (context) => ProfileBrandScreenProvider(),
      ),
      ChangeNotifierProvider<OnboardingScreenProvider>(
        create: (context) => OnboardingScreenProvider(),
      ),
      ChangeNotifierProvider<DropdownProvider>(
        create: (context) => DropdownProvider(),
      ),
      ChangeNotifierProvider<MapDefaultProvider>(
        create: (context) => MapDefaultProvider(),
      ),
      ChangeNotifierProvider<StepperScreenProvider>(
        create: (context) => StepperScreenProvider(),
      ),
      ChangeNotifierProvider<CustomizeUserExperienceProvider>(
        create: (context) => CustomizeUserExperienceProvider(),
      ),
      ChangeNotifierProvider<BottomNavProvider>(
        create: (context) => BottomNavProvider(),
      ),
      ChangeNotifierProvider<CampaignDetailsProvider>(
        create: (context) => CampaignDetailsProvider(),
      ),
      ChangeNotifierProvider<DropdownProvider>(
        create: (context) => DropdownProvider(),
      ),
      ChangeNotifierProvider<RatingProvider>(
        create: (context) => RatingProvider(),
      ),
      ChangeNotifierProvider<BadgeSelectionProvider>(
        create: (context) => BadgeSelectionProvider(),
      ),
      ChangeNotifierProvider<CategoryProvider>(
        create: (context) => CategoryProvider(),
      ),
      ChangeNotifierProvider<MyProfileProvider>(
        create: (context) => MyProfileProvider(),
      ),
    ];
  }
}
