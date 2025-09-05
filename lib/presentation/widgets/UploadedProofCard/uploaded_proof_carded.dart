import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import 'package:unyta/presentation/widgets/StatusBadge/status_badge.dart';
import '../../../core/styles/app_border_radius.dart';
import '../HorizontalImageScrollable/horizontal_image_scrollable.dart';
import '../UploadProofBottomSheet/upload_proof_bottomsheet.dart';

class UploadedProofCarded extends StatefulWidget {
  final String status;
  final String? caption;
  final bool? isHideButton;

  const UploadedProofCarded({
    super.key,
    required this.status,
    this.caption,
    this.isHideButton = false,
  });

  @override
  State<UploadedProofCarded> createState() => _UploadedProofCardedState();
}

class _UploadedProofCardedState extends State<UploadedProofCarded> {
  final TextEditingController captionController = TextEditingController();

  @override
  dispose() {
    captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: AppBorderRadius.roundedMedium,
          border: Border.all(color: Theme.of(context).colorScheme.surfaceDim),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "IG Post",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                StatusBadge(
                  text: widget.status,
                  horizontalPadding: 16,
                  verticalPadding: 8,
                  color: Colors.transparent,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (widget.status == "Pending") ...[
              widget.isHideButton == true
                  ? SizedBox()
                  : Column(
                    children: [
                      const SizedBox(height: 16),
                      Center(
                        child: ActionButton(
                          text: "Upload Proof",
                          buttonWidth: size.width * 0.5,
                          onPressed: () {
                            uploadProofBottomSheet(context, captionController);
                          },
                          borderColor: Theme.of(context).colorScheme.primary,
                          textColor: Theme.of(context).colorScheme.primary,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
            ] else ...[
              SizedBox(
                height: 200,
                child: HorizontalImageScroller(
                  images: [
                    "assets/images/collab_history_image.png",
                    "assets/images/collab_history_image.png",
                    "assets/images/collab_history_image.png",
                    "assets/images/collab_history_image.png",
                    "assets/images/collab_history_image.png",
                    "assets/images/collab_history_image.png",
                    "assets/images/collab_history_image.png",
                    "assets/images/collab_history_image.png",
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "My Caption",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              if (widget.caption != null) ...[
                const SizedBox(height: 5),
                Text(
                  widget.caption!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Center(
                child: ActionButton(
                  text: "View Details",
                  buttonWidth: size.width * 0.5,
                  onPressed: () {},
                  borderColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.primary,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

