import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../../provider/YouMatchScreenProvider/you_match_screen_provider.dart';
import '../../../widgets/ActionButton/action_button.dart';

class YouMatchScreen extends StatefulWidget {
  const YouMatchScreen({super.key});

  @override
  State<YouMatchScreen> createState() => _YouMatchScreenState();
}

class _YouMatchScreenState extends State<YouMatchScreen>
    with TickerProviderStateMixin {
  late MatchAnimationProvider animationProvider;

  @override
  void initState() {
    super.initState();
    animationProvider = MatchAnimationProvider(vsync: this);
  }

  @override
  void dispose() {
    animationProvider.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider.value(
      value: animationProvider,
      child: Consumer<MatchAnimationProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: SizedBox(
              width: double.infinity,
              height: size.height,
              child: Padding(
                padding: AppPaddings.all16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Success! You've Matched!",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "You",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: " and ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color:  Theme.of(context).colorScheme.onSecondary),
                          ),
                          TextSpan(
                            text: "skin treats",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                color: Theme.of(context).primaryColor,fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text:
                            " are a match!\n Time to connect and shape your collaboration together.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color:  Theme.of(context).colorScheme.onSecondary),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),

                    // Animated avatars + heart
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ScaleTransition(
                          scale: provider.avatarAnimation,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                            AssetImage("assets/images/match.png"),
                          ),
                        ),
                        ScaleTransition(
                          scale: provider.heartAnimation,
                          child: Image.asset(
                            "assets/images/heart_fill.png",
                            color: Theme.of(context).colorScheme.primary,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        ScaleTransition(
                          scale: provider.avatarAnimation,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                            AssetImage("assets/images/reviewImage.png"),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),
                    ActionButton(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      borderColor: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.chatTabBar);
                      },
                      text: "Open Chat",
                    ),
                    SizedBox(height: 20),
                    ActionButton(
                      textColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Colors.transparent,
                      borderColor: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                       Navigator.pushNamed(context, AppRoutes.checkCampaignBrief);
                      },
                      text: "Check Campaign Brief",
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
