import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/ProfileHeaderWidget/profile_header_widget.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../widgets/AboutTab/about_tab.dart';
import '../../../widgets/CollabHistoryTab/collab_history_tab.dart';
import '../../../widgets/MediaTab/media_tab.dart';
import '../../../widgets/ProfileAppBar/profile_app_bar.dart';
import '../../../widgets/ReviewTab/review_tab.dart';
import '../../../widgets/TabBarDelegant/tab_bar_delegant.dart';

class ProfileDetailScreen1 extends StatefulWidget {
  final String role;
  const ProfileDetailScreen1({super.key, this.role = "creator"});

  @override
  State<ProfileDetailScreen1> createState() => _ProfileDetailScreen1State();
}

class _ProfileDetailScreen1State extends State<ProfileDetailScreen1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ProfileAppBar(
          isShowEdit: widget.role.contains("creator") ? true : false,
          onBack: () => Navigator.pop(context),
          onEdit: () => Navigator.pushNamed(context, AppRoutes.stepperScreen),
          onShare: () => debugPrint("Share tapped"),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: ProfileHeaderWidget(
                  profileImage: "assets/images/Image profile.png",
                  username: "@olivia.style",
                  location: "London, UK",
                  followers: "42.6K",
                  engagementRate: "4.2%",
                  onInstagramTap: () => debugPrint("Instagram tapped"),
                  onTiktokTap: () => debugPrint("TikTok tapped"),
                  onYoutubeTap: () => debugPrint("YouTube tapped"),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: TabBarDelegate(
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'About'),
                      Tab(text: 'Media'),
                      Tab(text: 'Collab History'),
                      Tab(text: 'Reviews'),
                    ],
                    labelColor: Theme.of(context).colorScheme.primary,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor:
                    Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              AboutTab(role: widget.role,),
              MediaTab(),
              CollabHistoryTab(),
              ReviewTab(),
            ],
          ),
        ),
      ),
    );
  }

}

