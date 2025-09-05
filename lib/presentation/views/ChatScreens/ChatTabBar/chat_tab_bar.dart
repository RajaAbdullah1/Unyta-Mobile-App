import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/HomeAppBar/home_app_bar.dart';
import 'package:unyta/routes/app_routes.dart';

import '../../../../core/styles/app_paddings.dart';
import '../../../widgets/TabBarDelegant/tab_bar_delegant.dart';

class ChatTabBar extends StatefulWidget {
  const ChatTabBar({super.key});

  @override
  State<ChatTabBar> createState() => _ChatTabBarState();
}

class _ChatTabBarState extends State<ChatTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 3 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(title: "Olivia", profileImagePath: "assets/images/Image profile.png", onProfileTap: () {},),
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
                      "My Chats",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Your space to start conversations",
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
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Creators'),
                    Tab(text: 'Brands'),
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Theme.of(context).colorScheme.primary,
                  dividerColor: Colors.transparent,
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
            CreatorChatBar(),
            BrandChatBar(),
          ],
        ),
      ),
    );
  }
}

class CreatorChatBar extends StatelessWidget {
  const CreatorChatBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppPaddings.all16,
      itemBuilder: (context, index) {
      return ListTile(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.chatInboxScreen);
        },
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        minTileHeight: 0,
        leading: CircleAvatar(
          radius: 30,
          child: Image.asset("assets/images/reviewImage.png"),
        ),
        title: Text("Skin Treats", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
        subtitle: Text("This looks fantastic! I love", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
        trailing: Text("Chat", style: Theme.of(context).textTheme.bodyLarge),
      );
    }, itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(height: 16,),
    );
  }
}


class BrandChatBar extends StatelessWidget {
  const BrandChatBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppPaddings.all16,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => Navigator.pushNamed(context, AppRoutes.chatInboxScreen),
          minVerticalPadding: 0,
          minLeadingWidth: 0,
          minTileHeight: 0,
          leading: CircleAvatar(
            radius: 30,
            child: Image.asset("assets/images/reviewImage.png"),
          ),
          title: Text("Skin Treats", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),),
          subtitle: Text("This looks fantastic! I love", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
          trailing: Text("Chat", style: Theme.of(context).textTheme.bodyLarge),
        );
      }, itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(height: 16,),
    );
  }
}
