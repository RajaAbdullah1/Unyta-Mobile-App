import 'package:flutter/material.dart';

Widget bulletText(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("•  ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ],
    ),
  );
}