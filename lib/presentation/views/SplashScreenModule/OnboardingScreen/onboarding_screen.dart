import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import 'package:unyta/routes/app_routes.dart';

import '../../../../provider/OnboardingScreenProvider/onboarding_screen_provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<OnboardingScreenProvider>(
      builder: (context, provider, _) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                PageView.builder(
                  controller: provider.pageController,
                  itemCount: provider.onboardingPages.length,
                  onPageChanged: (index) => provider.setPage(index),
                  itemBuilder: (context, index) {
                    final page = provider.onboardingPages[index];

                    return AnimatedBuilder(
                      animation: provider.pageController,
                      builder: (context, child) {
                        double value = 1.0;
                        if (provider.pageController.position.haveDimensions) {
                          value = provider.pageController.page! - index;
                          value = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0);
                        }

                        return Stack(
                          children: [
                            /// Background Image with Parallax Zoom
                            Positioned.fill(
                              child: Transform.scale(
                                scale: value,
                                child: Image.asset(
                                  page.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            /// Gradient Overlay
                            Container(
                              width: size.width,
                              height: size.height,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black54,
                                    Colors.black38,
                                    Colors.black12,
                                  ],
                                ),
                              ),
                            ),

                            /// Animated Title & Description
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 140),
                                child: AnimatedOpacity(
                                  opacity: provider.currentIndex == index ? 1 : 0,
                                  duration: const Duration(milliseconds: 700),
                                  child: AnimatedSlide(
                                    duration: const Duration(milliseconds: 700),
                                    offset: provider.currentIndex == index
                                        ? const Offset(0, 0)
                                        : const Offset(0, 0.2),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          page.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(color: Colors.white),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          page.description,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),

                /// Fixed Logo (Top Center)
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: size.height * 0.1,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Fixed Bottom Area (Indicator + Button)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Page Indicator with Bounce
                        SmoothPageIndicator(
                          controller: provider.pageController,
                          count: provider.onboardingPages.length,
                          effect: const WormEffect(
                            activeDotColor: Colors.white,
                            dotColor: Colors.white54,
                            dotHeight: 8,
                            dotWidth: 8,
                            spacing: 6,
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// Button with Press Animation
                        GestureDetector(
                          onTapDown: (_) => provider.buttonPressed(true),
                          onTapUp: (_) => provider.buttonPressed(false),
                          onTapCancel: () => provider.buttonPressed(false),
                          child: AnimatedScale(
                            scale: provider.isButtonPressed ? 0.95 : 1.0,
                            duration: const Duration(milliseconds: 150),
                            child: ActionButton(
                              text:"Unlock Access",
                              onPressed: () {
                                if (provider.currentIndex ==
                                    provider.onboardingPages.length - 1) {
                                  // Navigate to login/home
                                  Navigator.pushReplacementNamed(context,AppRoutes.roleSelectionScreen);
                                } else {
                                  provider.nextPage();
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
