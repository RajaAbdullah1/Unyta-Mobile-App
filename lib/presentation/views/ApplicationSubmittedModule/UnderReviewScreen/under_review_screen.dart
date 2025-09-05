import 'package:flutter/material.dart';
import '../../../../data/models/InfoIItemsModel/info_items_model.dart';
import '../../../widgets/AppreciationMessageWidget/appreciation_message_widget.dart';
import '../../../widgets/InfoBulletContainer/info_bullet_container.dart';
import '../../../widgets/InfoSectionWidget/info_section_widget.dart';

class UnderReviewScreen extends StatelessWidget {
  const UnderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),
              const SizedBox(height: 8),

              Text(
                "Thank you for your application",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "We have received your submission and our team is currently reviewing your profile",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
              const SizedBox(height: 20),

              // What to expect next
              InfoContainer(
                imagePath: "assets/images/paper.png",
                title: "What to expect next",
                bulletPoints: [
                  "Your application will be reviewed by our team within 24–48 working hours.",
                  "If approved, you will receive a welcome email with the next steps to activate your profile.",
                  "We review applications based on content quality, audience engagement, and brand alignment.",
                  "If selected, you will gain access to premium collaborations with brands across lifestyle, fashion, beauty, food, and more.",
                ],
              ),

              const SizedBox(height: 16),

              // Built for creators section
              InfoSection(
                title:
                    "Built for creators to unlock new opportunities with ease",
                items: [
                  InfoItem(
                    iconPath: "assets/images/exclusiveAccess.png",
                    title: "Exclusive Access:",
                    description:
                        "Connect with high-quality brands seeking authentic partnerships.",
                  ),
                  InfoItem(
                    iconPath: "assets/images/gift.png",
                    title: "Complimentary Products & Experiences:",
                    description:
                        "Create content in exchange for curated offerings.",
                  ),
                  InfoItem(
                    iconPath: "assets/images/collaboration.png",
                    title: "Transparent Collaborations:",
                    description:
                        "No hidden terms. Every partnership includes clear deliverables and secure agreements.",
                  ),
                  InfoItem(
                    iconPath: "assets/images/matching.png",
                    title: "Curated Matching:",
                    description:
                        "We maintain strict guidelines to ensure every match is valuable and relevant.",
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Stay informed section
              InfoContainer(
                title: "Stay informed while you wait",
                bulletPoints: [
                  "Follow us on Instagram @unyta.app for platform updates and creator highlights.",
                  "Check your inbox for a confirmation email.",
                  "Need assistance? Reach out at contact@joinunyta.com",
                ],
              ),
              const SizedBox(height: 30),
              appreciationMessage(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
