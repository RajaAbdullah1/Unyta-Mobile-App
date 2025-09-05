import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unyta/presentation/views/AuthModule/LoginScreen/login_screen.dart';
import 'package:unyta/presentation/views/ChatScreens/ChatTabBar/chat_tab_bar.dart';
import 'package:unyta/presentation/views/NotificationScreen/notification_screen.dart';
import '../data/repositories/AnimatedRoute/animated_route.dart';
import '../presentation/views/ApplicationSubmittedModule/AdvancePlanScreen/advance_plan_screen.dart';
import '../presentation/views/ApplicationSubmittedModule/CreatorComparePlan/creator_compare_plan.dart';
import '../presentation/views/ApplicationSubmittedModule/ProfileApprovedScreen/profile_approved_screen.dart';
import '../presentation/views/ApplicationSubmittedModule/ProfileUnderReviewScreen/profile_under_review_screen.dart';
import '../presentation/views/ApplicationSubmittedModule/UnderReviewScreen/under_review_screen.dart';
import '../presentation/views/ApplicationSubmittedModule/WelcomeToAdvanceScreen/welcome_to_advance_screen.dart';
import '../presentation/views/ApplicationSubmittedModule/YourSubscriptionScreen/your_subscription_screen.dart';
import '../presentation/views/AuthModule/EmailSentScreen/email_sent_screen.dart';
import '../presentation/views/AuthModule/ForgotPasswordScreen/forgot_password_screen.dart';
import '../presentation/views/AuthModule/RoleSelectionScreen/role_selection_screen.dart';
import '../presentation/views/AuthModule/SignUpAsBrand/sign_up_as_brand.dart';
import '../presentation/views/AuthModule/SignUpMethodScreen/signup_method_screen.dart';
import '../presentation/views/AuthModule/SignUpScreen/signup_screen.dart';
import '../presentation/views/BadgesModule/BadgesAndRewardTabBar/badges_and_rewards_tab_bar.dart';
import '../presentation/views/BadgesModule/NeedHelpScreen/need_help_screen.dart';
import '../presentation/views/BadgesModule/YouAreConnected/you_are_connected.dart';
import '../presentation/views/BrandRoleScreens/BrandSideChatScreen/brand_side_chat_screen.dart';
import '../presentation/views/BrandRoleScreens/BrandsProfileModule/BrandHomePage/brand_home_page.dart';
import '../presentation/views/BrandRoleScreens/BrandsProfileModule/BrandProfileScreen/brand_profile_screen.dart';
import '../presentation/views/BrandRoleScreens/BrandsProfileModule/CampaignHistoryScreen/campaign_history_screen.dart';
import '../presentation/views/BrandRoleScreens/BrandsProfileModule/NewestCreatorScreen/newest_creator_screen.dart';
import '../presentation/views/BrandRoleScreens/CampaignCreationFlow/BrandCampaignBriefScreen/brand_campaign_brief_screen.dart';
import '../presentation/views/BrandRoleScreens/CampaignCreationFlow/CampaignPublishScreen/campaign_publish_screen.dart';
import '../presentation/views/BrandRoleScreens/CampaignCreationFlow/CampaignStepperScreen/campaign_stepper_screen.dart';
import '../presentation/views/BrandRoleScreens/CampaignCreationFlow/CreatorsSelectedScreen/creators_selected_screen.dart';
import '../presentation/views/BrandRoleScreens/CampaignCreationFlow/ViewCreatorScreen/view_creator_screen.dart';
import '../presentation/views/BrandRoleScreens/ExploreCampaignsBrandModule/ExploreCreatorScreen/explore_creator_screen.dart';
import '../presentation/views/BrandRoleScreens/MyCollabsBrandModule/BrandRatingSubmittedScreen/brand_rating_submitted_screen.dart';
import '../presentation/views/BrandRoleScreens/MyCollabsBrandModule/CampaignCompletedScreen/campaign_completed_screen.dart';
import '../presentation/views/BrandRoleScreens/MyCollabsBrandModule/CampaignStartedScreen/campaign_started_screen.dart';
import '../presentation/views/BrandRoleScreens/MyCollabsBrandModule/CompeletedDetailScreen/completed_detail_screen.dart';
import '../presentation/views/BrandRoleScreens/MyCollabsBrandModule/MyCollabsBrandTabBar/my_collabs_brand_tab_bar.dart';
import '../presentation/views/BrandRoleScreens/MyCollabsBrandModule/OngoingDetailScreen/ongoing_detail_screen.dart';
import '../presentation/views/BrandRoleScreens/MyCollabsBrandModule/PendingDetailScreen/pending_details_screen.dart';
import '../presentation/views/BrandRoleScreens/MyCollabsBrandModule/RateYourCreatorPartnerScreen/rate_your_creator_partner_screen.dart';
import '../presentation/views/BrandRoleScreens/MyCollabsBrandModule/ReviewSubmittedContentScreen/review_submitted_content_screen.dart';
import '../presentation/views/BrandRoleScreens/SubscriptionAndProfileSetupModule/ComparePlansScreen/compare_plan_screen.dart';
import '../presentation/views/BrandRoleScreens/SubscriptionAndProfileSetupModule/ProfileSetupTabBar/profile_setup_tab_bar.dart';
import '../presentation/views/BrandRoleScreens/SubscriptionAndProfileSetupModule/ScaleYourCreatorStrategy/scale_your_creator_strategy_screen.dart';
import '../presentation/views/BrandRoleScreens/SubscriptionAndProfileSetupModule/YourBrandIsReadyScreen/your_brand_is_ready_screen.dart';
import '../presentation/views/ChatScreens/ChatInboxScreen/chat_inbox_screen.dart';
import '../presentation/views/CreateProfileModule/HomeScreen/home_screen.dart';
import '../presentation/views/CreateProfileModule/PreviousCollabScreen/previous_collab_screen.dart';
import '../presentation/views/CreateProfileModule/ProfileDetailScreen/profile_detail_screen1.dart';
import '../presentation/views/CreateProfileModule/ReviewScreen/review_screen.dart';
import '../presentation/views/ExploreModule/CheckCampaignBrief/check_campaign_brief.dart';
import '../presentation/views/ExploreModule/ExploreCampaign/explore_campaigns_screen.dart';
import '../presentation/views/ExploreModule/YouMatchScreen/you_match_screen.dart';
import '../presentation/views/GlobalBrandMap/MapDefaultScreen/map_default_screen.dart';
import '../presentation/views/GlobalBrandMap/MapSearchScreen/map_search_screen.dart';
import '../presentation/views/MyCollabsModule/CampaignBriefScreen/campaign_brief_screen.dart';
import '../presentation/views/MyCollabsModule/CompletedTabCampaignBriefScreen/completed_tab_campaign_brief_screen.dart';
import '../presentation/views/MyCollabsModule/MyCollabsTabBar/my_collabs_tab_bar.dart';
import '../presentation/views/MyCollabsModule/PreviouslyUploadedProofScreen/previously_uploaded_proof_screen.dart';
import '../presentation/views/MyCollabsModule/ProofSubmittedScreen/proof_submitted_screen.dart';
import '../presentation/views/MyCollabsModule/RateYourBrandPartnerScreen/rate_your_brand_partner_screen.dart';
import '../presentation/views/MyCollabsModule/ReviewSubmittedScreen/review_submitted_screen.dart';
import '../presentation/views/PostSignUpModule/CommunityGuideLineScreen/community_guideline.dart';
import '../presentation/views/PostSignUpModule/SafetyPolicyScreen/safety_policy_screen.dart';
import '../presentation/views/PostSignUpModule/StepperScreen/stepper_screen.dart';
import '../presentation/views/PostSignUpModule/YourContentAndNicheScreen/your_content_and_niche_screen.dart';
import '../presentation/views/SettingsModule/AccountScreen/account_screen.dart';
import '../presentation/views/SettingsModule/EditProfileScreen/edit_profile_screen.dart';
import '../presentation/views/SettingsModule/ManageSubscriptionScreen/manage_subscription_screen.dart';
import '../presentation/views/SettingsModule/MyPofileScreen/my_profile_screen.dart';
import '../presentation/views/SettingsModule/NotificationSettingScreen/notification_setting_screen.dart';
import '../presentation/views/SettingsModule/PrivacyPolicyScreen/privacy_policy_screen.dart';
import '../presentation/views/SettingsModule/SocialMediaLinksScreen/social_media_links_screen.dart';
import '../presentation/views/SettingsModule/TermsAndConditions/terms_and_conditions.dart';
import '../presentation/views/SplashScreenModule/OnboardingScreen/onboarding_screen.dart';
import '../presentation/views/SplashScreenModule/SplashScreen/splash_screen.dart';
import '../presentation/widgets/BottomNav/bottom_nav.dart';
import '../presentation/widgets/BrandBottomNav/brand_bottom_nav.dart';
import '../presentation/widgets/OngoingTab/ongoing_tab.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    return _buildRoute(settings.name, args);
  }

  // Helper for animated pages
  static Route _animatedPage(
    Widget child, {
    Route Function(Widget)? transition,
  }) {
    transition ??= AnimatedRoute.fade; // default fade
    return transition(child);
  }

  static Route<dynamic> _buildRoute(String? name, Object? args) {
    switch (name) {
      // ----------------- Auth Module -----------------
      case AppRoutes.roleSelectionScreen:
        return _animatedPage(
          const RoleSelectionScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.signupMethodScreen:
        return _animatedPage(
          const SignupMethodScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.signupScreen:
        return _animatedPage(
          SignupScreen(role: args as String),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.loginScreen:
        final role = args as String;
        return _animatedPage(
          LoginScreen(role: role,),
          transition: AnimatedRoute.slideFromBottom,
        );

      case AppRoutes.emailSentScreen:
        return _animatedPage(EmailSentScreen());

      case AppRoutes.forgotPasswordScreen:
        return _animatedPage(
          ForgotPasswordScreen(),
          transition: AnimatedRoute.slideFromBottom,
        );

      case AppRoutes.signUpAsBrand:
        return _animatedPage(
          SignUpAsBrand(role: args as String),
          transition: AnimatedRoute.slideFromRight,
        );

      // ----------------- Application Submit Module -----------------
      case AppRoutes.advancePlanScreen:
        return _animatedPage(
          AdvancePlanScreen(
            alreadyCardDes:
                "50+ brands are already using Advanced for their journey with Unyta. Receive priority customer support, and match with over 250 creators.",
          ),
          transition: AnimatedRoute.scale,
        );

      case AppRoutes.creatorComparePlan:
        return _animatedPage(
          CreatorComparePlan(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.profileApprovedScreen:
        return _animatedPage(
          ProfileApprovedScreen(role: args as String),
          transition: AnimatedRoute.fade,
        );

      case AppRoutes.profileUnderReviewScreen:
        return _animatedPage(
          ProfileUnderReviewScreen(welcomeText: args as String),
          transition: AnimatedRoute.fade,
        );

      case AppRoutes.welcomeToAdvanceScreen:
        return _animatedPage(
          WelcomeToAdvanceScreen(),
          transition: AnimatedRoute.scale,
        );

      case AppRoutes.yourSubscriptionScreen:
        return _animatedPage(YourSubscriptionScreen());

      // ----------------- Badges Module -----------------
      case AppRoutes.badgesAndRewardsTabBar:
        return _animatedPage(BadgesAndRewardsTabBar());

      case AppRoutes.needHelpScreen:
        return _animatedPage(
          NeedHelpScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.youAreConnected:
        return _animatedPage(YouAreConnected());

      // ----------------- Chat Screens -----------------
      case AppRoutes.chatTabBar:
        return _animatedPage(ChatTabBar());

      case AppRoutes.chatInboxScreen:
        return _animatedPage(
          ChatInboxScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

        case AppRoutes.brandSideChatScreen:
        return _animatedPage(
          BrandSideChatScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      // ----------------- Create Profile Module -----------------
      case AppRoutes.homeScreen:
        return _animatedPage(HomeScreen());

      case AppRoutes.profileDetailScreen1:
        final role = args as String;
        return _animatedPage(
          ProfileDetailScreen1(role: role),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.previousCollabScreen:
        return _animatedPage(PreviousCollabScreen());

      case AppRoutes.reviewScreen:
        final map = args as Map<String, dynamic>;
        return _animatedPage(
          ReviewScreen(
            role: map["role"],
            name: map["name"],
            imagePath: map["imagePath"],
          ),
          transition: AnimatedRoute.slideFromBottom,
        );

      // ----------------- Explore Module -----------------
      case AppRoutes.exploreCampaignsScreen:
        return _animatedPage(ExploreCampaignsScreen());

      case AppRoutes.youMatchScreen:
        return _animatedPage(YouMatchScreen(), transition: AnimatedRoute.scale);

      // ----------------- Global Brand Map -----------------
      case AppRoutes.mapDefaultScreen:
        return _animatedPage(MapDefaultScreen());

      case AppRoutes.mapSearchScreen:
        return _animatedPage(
          MapSearchScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      // ----------------- My Collabs Module -----------------
      case AppRoutes.campaignBriefScreen:
        return _animatedPage(
          CampaignBriefScreen(status: args as String?),
          transition: AnimatedRoute.slideFromRight,
        );
        case AppRoutes.checkCampaignBrief:
        return _animatedPage(
          CheckCampaignBrief(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.myCollabsTabBar:
        return _animatedPage(MyCollabsTabBar());

      case AppRoutes.previouslyUploadedProofScreen:
        return _animatedPage(PreviouslyUploadedProofScreen());

      case AppRoutes.proofSubmittedScreen:
        return _animatedPage(ProofSubmittedScreen());

      case AppRoutes.rateYourBrandPartnerScreen:
        return _animatedPage(
          RateYourBrandPartnerScreen(),
          transition: AnimatedRoute.slideFromBottom,
        );

      case AppRoutes.reviewSubmittedScreen:
        return _animatedPage(ReviewSubmittedScreen());

      // ----------------- Settings Module -----------------
      case AppRoutes.accountScreen:
        return _animatedPage(AccountScreen());

      case AppRoutes.editProfileScreen:
        return _animatedPage(
          EditProfileScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.manageSubscriptionScreen:
        return _animatedPage(ManageSubscriptionScreen());

      case AppRoutes.myProfileScreen:
        return _animatedPage(MyProfileScreen());

      case AppRoutes.notificationSettingScreen:
        return _animatedPage(NotificationSettingScreen());

      case AppRoutes.privacyPolicyScreen:
        return _animatedPage(PrivacyPolicyScreen());

      case AppRoutes.socialMediaLinksScreen:
        return _animatedPage(
          SocialMediaLinksScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.termsAndConditions:
        return _animatedPage(TermsAndConditions());

      // ----------------- Brand Role Screens -----------------
      case AppRoutes.brandHomePage:
        return _animatedPage(BrandHomePage());

      case AppRoutes.brandProfileScreen:
        return _animatedPage(
          BrandProfileScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.campaignHistoryScreen:
        return _animatedPage(CampaignHistoryScreen());

      case AppRoutes.newestCreatorScreen:
        return _animatedPage(
          NewestCreatorScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      // ----------------- Campaign Creation Flow -----------------
      case AppRoutes.brandCampaignBriefScreen:
        return _animatedPage(
          BrandCampaignBriefScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.campaignPublishScreen:
        return _animatedPage(CampaignPublishScreen());

      case AppRoutes.campaignStepperScreen:
        return _animatedPage(CampaignStepperScreen());

      case AppRoutes.creatorsSelectedScreen:
        return _animatedPage(
          CreatorsSelectedScreen(),
          transition: AnimatedRoute.slideFromBottom,
        );

      case AppRoutes.viewCreatorScreen:
        return _animatedPage(
          ViewCreatorScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      // ----------------- Explore Creator Brand Module -----------------
      case AppRoutes.exploreCreatorScreen:
        return _animatedPage(ExploreCreatorScreen());

      // ----------------- My Collabs Brand Module -----------------
      case AppRoutes.myCollabsBrandTabBar:
        return _animatedPage(MyCollabsBrandTabBar());

      case AppRoutes.ongoingDetailScreen:
        return _animatedPage(
          OngoingDetailScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.reviewSubmittedContentScreen:
        return _animatedPage(ReviewSubmittedContentScreen());

      case AppRoutes.campaignCompletedScreen:
        return _animatedPage(CampaignCompletedScreen());

      case AppRoutes.rateYourCreatorPartnerScreen:
        return _animatedPage(
          RateYourCreatorPartnerScreen(),
          transition: AnimatedRoute.slideFromBottom,
        );

      case AppRoutes.brandRatingSubmittedScreen:
        return _animatedPage(BrandRatingSubmittedScreen());

      case AppRoutes.pendingDetailsScreen:
        return _animatedPage(PendingDetailsScreen());

      case AppRoutes.campaignStartedScreen:
        return _animatedPage(CampaignStartedScreen());

      case AppRoutes.completedDetailScreen:
        return _animatedPage(CompletedDetailScreen());

      // ----------------- Subscription & Profile Setup -----------------
      case AppRoutes.comparePlanScreen:
        return _animatedPage(ComparePlanScreen());

      case AppRoutes.profileSetupTabBar:
        return _animatedPage(ProfileSetupTabBar());

      case AppRoutes.scaleYourCreatorStrategyScreen:
        return _animatedPage(ScaleYourCreatorStrategyScreen());

      case AppRoutes.yourBrandIsReadyScreen:
        return _animatedPage(YourBrandIsReadyScreen());

      // ----------------- Splash Module -----------------
      case AppRoutes.splashScreen:
        return _animatedPage(SplashScreen(), transition: AnimatedRoute.fade);

      case AppRoutes.onboardingScreen:
        return _animatedPage(
          OnboardingScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      // ----------------- Bottom Navigation -----------------
      case AppRoutes.bottomNav:
        return _animatedPage(
          BottomNav(index: args as int),
          transition: AnimatedRoute.fade,
        );

        case AppRoutes.brandBottomNav:
        return _animatedPage(
          BrandBottomNav(index: args as int),
          transition: AnimatedRoute.fade,
        );

      case AppRoutes.ongoingTab:
        return _animatedPage(OngoingTab());

      // ----------------- Post Sign Up Module -----------------
      case AppRoutes.communityGuideline:
        final arg = args as String;
        return _animatedPage(
          CommunityGuideline(role: arg),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.safetyPolicyScreen:
        return _animatedPage(
          SafetyPolicyScreen(role: args as String?),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.stepperScreen:
        return _animatedPage(
          StepperScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      case AppRoutes.yourContentAndNicheScreen:
        return _animatedPage(
          YourContentAndNicheScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      // ----------------- My Collabs Module -----------------
      case AppRoutes.completedTabCampaignBriefScreen:
        return _animatedPage(
          CompletedTabCampaignBriefScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      // ----------------- Application Submitted Module -----------------
      case AppRoutes.underReviewScreen:
        return _animatedPage(
          UnderReviewScreen(),
          transition: AnimatedRoute.fade,
        );

      // ----------------- Notifications -----------------
      case AppRoutes.notificationScreen:
        return _animatedPage(
          NotificationScreen(),
          transition: AnimatedRoute.slideFromRight,
        );

      // ----------------- Default -----------------
      default:
        return MaterialPageRoute(
          builder:
              (_) => WillPopScope(
                onWillPop: () async {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                  return false;
                },
                child: const Scaffold(
                  body: Center(child: Text('Route not found')),
                ),
              ),
        );
    }
  }
}
