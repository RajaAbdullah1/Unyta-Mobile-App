import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../widgets/CompletedBrandTab/completed_brand_tab.dart';
import '../../../../widgets/HomeAppBar/home_app_bar.dart';
import '../../../../widgets/OngoingBrandTab/ongoing_brand_tab.dart';
import '../../../../widgets/PedingBrandTab/pending_brand_tab.dart';
import '../../../../widgets/TabBarDelegant/tab_bar_delegant.dart';

class MyCollabsBrandTabBar extends StatefulWidget {
  const MyCollabsBrandTabBar({super.key});

  @override
  State<MyCollabsBrandTabBar> createState() => _MyCollabsBrandTabBarState();
}

class _MyCollabsBrandTabBarState extends State<MyCollabsBrandTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: "skin treats",
        profileImagePath: "assets/images/reviewImage.png",
        onProfileTap: () {},
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPaddings.all16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Campaigns",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Discover your past campaigns and keep track of your completed collaborations, all in one place.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: TabBarDelegate(
                TabBar(
                  padding: AppPaddings.horizontal16,
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Ongoing',),
                    Tab(text: 'Pending'),
                    Tab(text: 'Completed'),
                  ],
                  labelColor: Theme.of(context).colorScheme.primary,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Theme.of(context)
                      .colorScheme
                      .onSurface.withValues(alpha: 0.6),
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  labelStyle:
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            OngoingBrandTab(),
            PendingBrandTab(),
            CompletedBrandTab(),
          ],
        ),
      ),
    );
  }
}
