import 'package:flutter/material.dart';

class ShadowCircleButton extends StatelessWidget {
  final IconData icon;
  final double radius;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const ShadowCircleButton({
    super.key,
    required this.icon,
    this.radius = 20,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.transparent,
          child: Icon(
            icon,
            color: iconColor ?? Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
