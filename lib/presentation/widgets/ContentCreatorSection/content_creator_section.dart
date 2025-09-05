import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';

import '../../../routes/app_routes.dart';
import '../NewCreatorCard/new_creator_card.dart';
import '../StatusBadge/status_badge.dart';

class ContentCreatorsSection extends StatelessWidget {
  final TabController tabController;

  const ContentCreatorsSection({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPaddings.horizontal16,
          child: Text(
            "Content Creators",
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: AppPaddings.horizontal16,
          child: TabBar(
            controller: tabController,
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
            labelStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: "Creator Request"),
              Tab(text: "Selected Creators"),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(
                padding: AppPaddings.all16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    StatusBadge(
                      onTap: () {},
                      text: "Requests received: 12",
                      verticalPadding: 4,
                      horizontalPadding: 8,
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child:
                          CreatorCard(
                            name: "Olivia Jen",
                            username: "@olivia.style",
                            imagePath: "assets/images/match.png",
                            onTap: () {
                              debugPrint("View Profile clicked for Olivia Jen");
                            },
                            buttonLabel: "Select",
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    ActionButton(
                      borderColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.primary,
                      backgroundColor:
                          Theme.of(context).colorScheme.surfaceBright,
                      text: "Start Campaign",
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.creatorsSelectedScreen,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: AppPaddings.all16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    StatusBadge(
                      onTap: () {},
                      text: "Selected: 2",
                      verticalPadding: 4,
                      horizontalPadding: 8,
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CreatorCard(
                            name: "Olivia Jen",
                            username: "@olivia.style",
                            imagePath: "assets/images/match.png",
                            onTap: () {
                              debugPrint("View Profile clicked for Olivia Jen");
                            },
                            isShowDeleteIcon: true,
                            buttonLabel: "Send Product",
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    ActionButton(
                      text: "Start Campaign",
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.creatorsSelectedScreen,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
