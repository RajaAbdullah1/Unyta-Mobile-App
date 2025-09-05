import '../../data/models/ProfileOptionModel/profile_option_model.dart';

class AppConstants {
  static const List<String> defaultCategories = [
    'Fashion',
    'Beauty',
    "Technology",
    "Travel",
    "Food & Beverage",
    "Fitness",
    "Wellness",
    "Home & Decor",
    "Education",
    "Music",
    "Art",
    "Photography"
  ];

  static final List<ProfileOption> profileOptions = [
    ProfileOption(
      iconPath: "assets/images/account.png",
      title: "Account",
    ),
    ProfileOption(
      iconPath: "assets/images/community_guideline.png",
      title: "Community Guidelines",
    ),
    ProfileOption(
      iconPath: "assets/images/delivery_address.png",
      title: "Delivery Address",
    ),
    ProfileOption(
      iconPath: "assets/images/linked_social_media.png",
      title: "Linked Social Media",
    ),
    ProfileOption(
      iconPath: "assets/images/privacy_policy.png",
      title: "Privacy policy",
    ),
    ProfileOption(
      iconPath: "assets/images/terms_and_conditions.png",
      title: "Terms & Conditions",
    ),
    ProfileOption(
      iconPath: "assets/images/bell.png",
      title: "Notifications",
    ),
    ProfileOption(
      iconPath: "assets/images/profile_bagde.png",
      title: "Badges & Rewards",
    ),
  ];

  static final tags = ["Beauty", "Wellness", "Fashion", "Skincare", "Minimalist"];

  static final List<ProfileOption> profileOptions2 = [
    ProfileOption(
      iconPath: "assets/images/report_problem.png",
      title: "Report a problem",
    ),
    ProfileOption(
      iconPath: "assets/images/password.png",
      title: "Password",
    ),
    ProfileOption(
      iconPath: "assets/images/help_center.png",
      title: "Help center",
    ),
    ProfileOption(
      iconPath: "assets/images/switch_account.png",
      title: "Switch Account",
    ),
    ProfileOption(
      iconPath: "assets/images/logout.png",
      title: "Log out",
    ),
  ];

  static const List<String> defaultFollowersList = [
    '15k',
    '10k',
    "20k",
    "50k+",
  ];


  static const List<String> brandIdentityTagsList = [
    'Minimalist',
    'Clean Beauty',
    "Gender-Neutral",
    "Eco-Friendly",
  ];
}