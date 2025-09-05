import 'package:flutter/material.dart';

import '../TimeStampWidget/time_stamp_Widget.dart';

class IncomingMessageWidget extends StatelessWidget {
  final String message;
  final String time;

  const IncomingMessageWidget({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: timeStamp(time),
          ),

        ],
      ),
    );
  }
}





class OutgoingMessageWidget extends StatelessWidget {
  final String message;
  final String time;

  const OutgoingMessageWidget({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: timeStamp(time),
          ),
        ],
      ),
    );
  }
}
