import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../../provider/CompletedTabCampaignBriefProvider/completed_tab_campaign_brief_provider.dart';
import '../../../../widgets/AboutCreatorBrandCompletedTab/about_creator_brand_completed_tab.dart';
import '../../../../widgets/CampaignDesCard/campaign_des_card.dart';
import '../../../../widgets/CampignBriefCard/campaign_brief_card.dart';
import '../../../../widgets/CreatorReviewSection/creator_review_section.dart';
import '../../../../widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../widgets/HeadingSection/heading_section.dart';
import '../../../../widgets/ReviewByBrandCard/review_by_brand_card.dart';

class CompletedDetailScreen extends StatefulWidget {
  const CompletedDetailScreen({super.key});

  @override
  State<CompletedDetailScreen> createState() => _CompletedDetailScreenState();
}

class _CompletedDetailScreenState extends State<CompletedDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detailsProvider = Provider.of<CampaignDetailsProvider>(context);
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Campaign Brief",
        subtitle:
            "Review your campaign and mark as completed if you're happy to move forward",
        height: MediaQuery.of(context).size.height * 0.18,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPaddings.all16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headingSection(
                      "About Creator",
                      "Get to know who you’re collaborating with",
                      context,
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(2, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: AboutCreatorBrandCompletedTab(
                          name: "Olivia Jen ASD",
                          username: "@olivia.style",
                          imagePath: "assets/images/match.png",
                          buttonLabel: "View Profile",
                          onProfileTap: () {
                            debugPrint("View Profile clicked for Olivia Jen");
                          },
                          onProofTap: () {
                            debugPrint("Proof clicked for Olivia Jen");
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    CampaignBriefCard(
                      brandImagePath: "assets/images/reviewImage.png",
                      description:
                          "Get featured with our new skincare drop — free full-size set for creators who align with our brand.",
                      title: "Glow-Up Essentials Gifting Campaign",
                    ),

                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => detailsProvider.toggleDetails(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            detailsProvider.isExpanded
                                ? "Hide Details"
                                : "View Full Details",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          AnimatedRotation(
                            turns: detailsProvider.isExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      child: AnimatedOpacity(
                        opacity: detailsProvider.isExpanded ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child:
                            detailsProvider.isExpanded
                                ? Column(
                                  children: const [
                                    SizedBox(height: 10),
                                    CampaignDesCard(
                                      title: "What's Included",
                                      cardName: "whatsIncluded",
                                      secondLastTitle: "Shipping Info:",
                                      secondLastValue:
                                          "Ships within 3–5 business days after approval",
                                      lastTitle: "Product Status:",
                                      lastValue: "Shipped by Brand",
                                    ),
                                    SizedBox(height: 20),
                                    CampaignDesCard(
                                      title: "Content Requirements",
                                      cardName: "contentRequirement",
                                      secondLastTitle: "Content Due Date:",
                                      secondLastValue: "May 5, 2025",
                                      lastTitle: "Hashtags/Mentions:",
                                      lastValue:
                                          "#GlowWithSkinTreats   @skintreats",
                                    ),
                                    SizedBox(height: 20),
                                    CampaignDesCard(
                                      title: "Who This Is For",
                                      cardName: "who",
                                      secondLastTitle: "Ideal Creator:",
                                      secondLastValue:
                                          "Skincare, wellness, or lifestyle niche",
                                      lastTitle: "Follower Range:",
                                      lastValue: "5K – 100K",
                                    ),
                                  ],
                                )
                                : const SizedBox.shrink(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(thickness: 0.5),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppPaddings.horizontal16,
              child: Text(
                "Activity on this campaign",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Theme.of(context).colorScheme.primary,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: const [
                      Tab(text: "Review by Creator"),
                      Tab(text: "My Review"),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // ---------------- Review by Creator ----------------
                  SingleChildScrollView(
                    padding: AppPaddings.all16,
                    child: CreatorReviewSection(),
                  ),
                  SingleChildScrollView(
                    padding: AppPaddings.all16,
                    child: ReviewByBrandCard(
                      title: "Review by Me",
                      overallRating: 4.0,
                      collaborationFeedback: "Very good",
                      contentQuality: "High-quality and delivery on time",
                      communication: "Off Course",
                      onActionPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
