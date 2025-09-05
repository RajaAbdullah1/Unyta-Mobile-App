import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../../provider/CompletedTabCampaignBriefProvider/completed_tab_campaign_brief_provider.dart';
import '../../../../widgets/CampaignCard/compaign_card.dart';
import '../../../../widgets/CampaignDesCard/campaign_des_card.dart';
import '../../../../widgets/ContentCreatorSection/content_creator_section.dart';
import '../../../../widgets/CustomTitleAppBar/custom_title_appbar.dart';

class PendingDetailsScreen extends StatefulWidget {
  const PendingDetailsScreen({super.key});

  @override
  State<PendingDetailsScreen> createState() => _PendingDetailsScreenState();
}

class _PendingDetailsScreenState extends State<PendingDetailsScreen>
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
        title: "Review Creators",
        subtitle:
            "View proof submissions, approve content, and reward top creators.",
        height: MediaQuery.of(context).size.height * 0.18,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPaddings.all16,
                child: Column(
                  children: [

                    //**********************  Spring Style Card  ***********************//
                    CampaignCard(
                      title: "Spring Style Essentials",
                      subtitle: "3-piece outfit",
                      date: "May 14, 2025",
                      locationLabel: "Campaign location:",
                      location: "Spring Style Essentials",
                      deliverablesLabel: "Deliverables:",
                      deliverables: "1 Reel + 2 IG stories",
                      isShowIcons: true,
                      deletedOnTap: () => detailsProvider.handleDialog(context),
                    ),
                    const SizedBox(height: 20),

                    //**********************  View Details Section ***********************//
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

        //**********************  Content Creators Section ***********************//
        body: ContentCreatorsSection(tabController: _tabController),
      ),
    );
  }
}
