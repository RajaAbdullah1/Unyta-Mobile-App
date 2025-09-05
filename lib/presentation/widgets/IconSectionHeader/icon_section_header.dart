import 'package:flutter/material.dart';

class IconSectionHeader extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isShowEdit;
  final VoidCallback onEdit;

  const IconSectionHeader({
    super.key,
    required this.title,
    required this.imagePath,
    this.isShowEdit = true,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        if(isShowEdit == true)
        IconButton(
          onPressed: onEdit,
          icon: Image.asset(
            imagePath,
            height: 30,
            width: 30,
          ),
        ),
      ],
    );
  }
}
