import 'package:flutter/material.dart';

class AnimatedRoute {
  static Route fade(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        return FadeTransition(opacity: curved, child: child);
      },
      transitionDuration: const Duration(milliseconds: 600),
    );
  }

  static Route slideFromRight(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCubic,
        );
        final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        return SlideTransition(position: curved.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 600),
    );
  }

  static Route slideFromBottom(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        final tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        return SlideTransition(position: curved.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 600),
    );
  }

  static Route scale(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        );
        return ScaleTransition(scale: curved, child: child);
      },
      transitionDuration: const Duration(milliseconds: 600),
    );
  }

  static Route rotation(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutBack,
        );
        return RotationTransition(turns: curved, child: child);
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
