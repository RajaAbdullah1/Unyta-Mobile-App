import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../widgets/PendingTab/pending_tab.dart';
import '../../../widgets/ProofApprovedTab/proof_approved_tab.dart';
import '../../../widgets/RevisionTab/revision_tab.dart';
import '../../../widgets/TabBarDelegant/tab_bar_delegant.dart';

class BadgesAndRewardsTabBar extends StatefulWidget {
  const BadgesAndRewardsTabBar({super.key});

  @override
  State<BadgesAndRewardsTabBar> createState() => _BadgesAndRewardsTabBarState();
}

class _BadgesAndRewardsTabBarState extends State<BadgesAndRewardsTabBar>
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar : CustomTitleAppBar(title: "Badges & Rewards", height: size.height * 0.2, subtitle: "Monitor the progress of your collaborations — from submission to approval and badge rewards.",),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                pinned: true,
                delegate: TabBarDelegate(
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Proof Approved'),
                      Tab(text: 'Pending'),
                      Tab(text: 'Revision'),
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
              ProofApprovedTab(),
              PendingTab(),
              RevisionTab(),
            ],
          ),
        ),
      ),
    );
  }
}

