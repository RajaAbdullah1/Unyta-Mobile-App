import 'package:flutter/material.dart';

import '../TimeStampWidget/time_stamp_Widget.dart';

class FileMessageBubble extends StatelessWidget {
  final String message;
  final String fileName;
  final String fileSize;
  final String fileIconPath;
  final String time;
  final String downloadIconPath;
  final VoidCallback onDownload;

  const FileMessageBubble({
    super.key,
    required this.message,
    required this.fileName,
    required this.fileSize,
    required this.fileIconPath,
    required this.time,
    required this.downloadIconPath,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Message text
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),

                // File attachment container
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // File icon
                      Image.asset(
                        fileIconPath,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 8),

                      // File details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fileName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              fileSize,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: onDownload,
                        icon: Image.asset(
                          downloadIconPath,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: timeStamp(time),
        ),
      ],
    );
  }
}
