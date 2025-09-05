import 'package:flutter/material.dart';
import '../DualActionButton/dual_action_button.dart';
import '../StatusBadge/status_badge.dart';
import '../SubmittedProofBottomSheet/submitted_proof_bottomSheet.dart';
import '../TextFieldWidget/text_field_widget.dart';

void uploadProofBottomSheet(
  BuildContext context,
  TextEditingController captionController,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Text(
              "Upload Proof",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
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
                  text: "Pending",
                  horizontalPadding: 16,
                  verticalPadding: 8,
                  color: Colors.transparent,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Image.asset("assets/images/placeholder.png"),
            const SizedBox(height: 24),
            TextFieldWidget(
              controller: captionController,
              hintText: "Caption (Optional)",
              keyboardType: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(height: 24),
            DualActionButtons(
              leftButtonText: "Cancel",
              onLeftPressed: () {
                Navigator.pop(context);
              },
              rightButtonText: "Upload Proof",
              onRightPressed: () {
                Navigator.pop(context);
                submittedProofBottomSheet(context, "Revision");
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
