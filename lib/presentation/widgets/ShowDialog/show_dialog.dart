import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> showDialogWidget({
  required BuildContext context,
  required String title,
  String? content,
  String cancelText = "Cancel",
  String yesText = "Yes",
}) async {
  return showCupertinoDialog<bool>(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        content: content != null
            ? Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
            : null,
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              cancelText,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              yesText,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      );
    },
  );
}
