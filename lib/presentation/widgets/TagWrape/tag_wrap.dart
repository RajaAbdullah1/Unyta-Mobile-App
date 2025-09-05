import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../BuildTag/build_tag.dart';

class TagsWrap extends StatelessWidget {
  const TagsWrap({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: AppConstants.tags
            .map(
              (tag) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: buildTag(context, tag),
          ),
        )
            .toList(),
      ),
    );
  }
}
