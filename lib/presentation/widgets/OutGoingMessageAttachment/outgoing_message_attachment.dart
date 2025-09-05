import 'package:flutter/material.dart';

import '../TimeStampWidget/time_stamp_Widget.dart';

class OutgoingMessageAttachment extends StatelessWidget {
  final String imagePath;
  final String time;

  const OutgoingMessageAttachment({
    super.key,
    required this.imagePath,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(alignment: Alignment.bottomRight, child: timeStamp(time)),
        const SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(imagePath, width: 220),
        ),
      ],
    );
  }
}
