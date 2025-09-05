import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:unyta/provider/SplashScreenProvider/splash_screen_provider.dart';
import 'package:unyta/routes/app_routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashScreenProvider>(context, listen: false).startAnimation();
    });

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      body: Center(
        child: Consumer<SplashScreenProvider>(
          builder: (_, provider, __) {
            return AnimatedOpacity(
              opacity: provider.opacity,
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              child: AnimatedScale(
                scale: provider.scale,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutBack,
                child: Image.asset(
                  "assets/images/logo_with_text.png",
                  height: size.height * 0.2,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
