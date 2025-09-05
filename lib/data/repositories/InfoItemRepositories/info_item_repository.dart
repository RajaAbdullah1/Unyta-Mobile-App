import '../../models/InfoIItemsModel/info_items_model.dart';

class InfoItemsRepository {
  static List<InfoItem> getItemsByRole(String role) {
    final creatorItems = [
      InfoItem(
        iconPath: "assets/images/explore.png",
        title: "Explore Opportunities:",
        description: "View campaigns by category (Beauty, Travel, etc.)",
      ),
      InfoItem(
        iconPath: "assets/images/matching.png",
        title: "My Matches:",
        description: "Start matching with campaigns that fit your niche",
      ),
      InfoItem(
        iconPath: "assets/images/calender.png",
        title: "Manage Campaigns",
        description: "Track your deliverables, due dates and content status.",
      ),
      InfoItem(
        iconPath: "assets/images/profile.png",
        title: "My Profile:",
        description: "Edit audience info, update platforms",
      ),
    ];

    final brandItems = [
      InfoItem(
        iconPath: "assets/images/post_campaign.png",
        title: "Post Campaigns:",
        description: "Start matching with creators",
      ),
      InfoItem(
        iconPath: "assets/images/creator_discovery.png",
        title: "Creator Discovery:",
        description: "Filter by niche, audience, location and demographics",
      ),
      InfoItem(
        iconPath: "assets/images/my_campaigns.png",
        title: "My Campaigns",
        description: "Track submissions, status, and content",
      ),
      InfoItem(
        iconPath: "assets/images/brand_settings.png",
        title: "Brand Settings:",
        description: "Manage profile, subscription and collaboration preferences",
      ),
    ];

    return role == "Creator" ? creatorItems : brandItems;
  }
}
