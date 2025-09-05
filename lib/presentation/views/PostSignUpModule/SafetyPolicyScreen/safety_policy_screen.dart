import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../data/models/SafetyPolicyModel/safety_policy_model.dart';
import '../../../../data/repositories/SafetyPolicyContent/safety_policy_content.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/InfoBulletContainer/info_bullet_container.dart';
import '../../../widgets/LableCheckBox/lable_check_box.dart';
import '../../../widgets/LegalNoteWidget/legal_note_widget.dart';

class SafetyPolicyScreen extends StatelessWidget {
  final String? role;

  const SafetyPolicyScreen({super.key, this.role});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final SafetyPolicyModel data = SafetyPolicyContent.getContent(
      role ?? "",
    );
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: data.title,
        subtitle: data.subtitle,
        height: size.height * 0.18,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoContainer(
                imagePath: "assets/images/paper.png",
                title: "Policy Summary",
                bulletPoints: data.bullets,
              ),
              const SizedBox(height: 16),
              legalNoteWidget(context),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: AppPaddings.horizontal16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LabeledCheckbox(
              label: "I have read and understood the Safety Policy",
              onChanged: (value) {},
              value: true,
            ),
            ActionButton(
              text: "Next",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.communityGuideline, arguments: role);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
