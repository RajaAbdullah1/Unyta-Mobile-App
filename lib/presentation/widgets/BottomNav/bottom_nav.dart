import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_border_radius.dart';
import 'package:unyta/presentation/views/ChatScreens/ChatTabBar/chat_tab_bar.dart';
import 'package:unyta/presentation/views/CreateProfileModule/HomeScreen/home_screen.dart';
import 'package:unyta/presentation/views/ExploreModule/ExploreCampaign/explore_campaigns_screen.dart';
import 'package:unyta/presentation/views/GlobalBrandMap/MapDefaultScreen/map_default_screen.dart';
import '../../../core/themes/app_theme.dart';
import '../../../provider/BottomNavProvider/bottom_nav_provider.dart';
import '../../views/MyCollabsModule/MyCollabsTabBar/my_collabs_tab_bar.dart';

class BottomNav extends StatefulWidget {
  final int index;
  const BottomNav({super.key, required this.index});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  Widget _buildImage(String path, double size, {Color? color}) {
    return Image.asset(
      path,
      width: size,
      height: size,
      fit: BoxFit.contain,
      color: color,
    );
  }

  final List<Widget> _pages = const [
    HomeScreen(),
    ChatTabBar(),
    ExploreCampaignsScreen(),
    MapDefaultScreen(),
    MyCollabsTabBar(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BottomNavProvider>(context, listen: false);
      provider.setIndex(widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomNavProvider>();
    final navTheme = Theme.of(context).bottomNavigationBarTheme;
    final iconSize = AppTheme.bottomNavIconSize;

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          final scaleAnim = Tween<double>(begin: 1.1, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
          );
          final offsetAnim = Tween<Offset>(
            begin: const Offset(0, 0.01), // tiny lift
            end: Offset.zero,
          ).animate(animation);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: offsetAnim,
              child: ScaleTransition(scale: scaleAnim, child: child),
            ),
          );
        },

        child: _pages[provider.currentIndex],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceBright,
          borderRadius: AppBorderRadius.roundedLarge,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: AppBorderRadius.roundedLarge,
          child: BottomNavigationBar(
            backgroundColor: navTheme.backgroundColor,
            elevation: 0,
            currentIndex: provider.currentIndex,
            type: navTheme.type ?? BottomNavigationBarType.fixed,
            onTap: provider.setIndex,
            items: [
              BottomNavigationBarItem(
                icon: AnimatedScale(
                  scale: provider.currentIndex == 0 ? 1.2 : 1.0, // 🔥 smooth zoom
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                  child: _buildImage(
                    'assets/images/home_nav.png',
                    iconSize,
                    color: provider.currentIndex == 0
                        ? navTheme.selectedItemColor
                        : navTheme.unselectedItemColor,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: AnimatedScale(
                  scale: provider.currentIndex == 1 ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                  child: _buildImage(
                    'assets/images/message.png',
                    iconSize,
                    color: provider.currentIndex == 1
                        ? navTheme.selectedItemColor
                        : navTheme.unselectedItemColor,
                  ),
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: AnimatedScale(
                  scale: provider.currentIndex == 2 ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                  child: _buildImage(
                    'assets/images/matches.png',
                    iconSize,
                    color: provider.currentIndex == 2
                        ? navTheme.selectedItemColor
                        : navTheme.unselectedItemColor,
                  ),
                ),
                label: 'Match',
              ),
              BottomNavigationBarItem(
                icon: AnimatedScale(
                  scale: provider.currentIndex == 3 ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                  child: _buildImage(
                    'assets/images/map_nav.png',
                    iconSize,
                    color: provider.currentIndex == 3
                        ? navTheme.selectedItemColor
                        : navTheme.unselectedItemColor,
                  ),
                ),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: AnimatedScale(
                  scale: provider.currentIndex == 4 ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack,
                  child: _buildImage(
                    'assets/images/my_collabs.png',
                    iconSize,
                    color: provider.currentIndex == 4
                        ? navTheme.selectedItemColor
                        : navTheme.unselectedItemColor,
                  ),
                ),
                label: 'My Collabs',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
