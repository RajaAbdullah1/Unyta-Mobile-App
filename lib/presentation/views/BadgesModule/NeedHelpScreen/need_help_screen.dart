import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/ActionButton/action_button.dart';
import '../../../../data/repositories/Validation/validation.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../widgets/TextFieldWidget/text_field_widget.dart';

class NeedHelpScreen extends StatefulWidget {
  const NeedHelpScreen({super.key});

  @override
  State<NeedHelpScreen> createState() => _NeedHelpScreenState();
}

class _NeedHelpScreenState extends State<NeedHelpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController attachFileController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    descriptionController.dispose();
    attachFileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Need Help or Want to Report a Problem?",
        height: size.height * 0.22,
        subtitle:
            "We’re here for you — whether you need support or want to flag inappropriate behavior.",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.all20,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //check drop down design in figma
                TextFieldWidget(
                  controller: descriptionController,
                  hintText: "Issue Type",
                  keyboardType: TextInputType.name,
                  validator: (value) => AppValidation.validateName("Issue Type"),
                ),
                SizedBox(height: 16),
                TextFieldWidget(
                  controller: descriptionController,
                  maxLines: 5,
                  hintText: "Describe the issue",
                  keyboardType: TextInputType.name,
                  validator: (value) => AppValidation.validateName("Describe"),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Tell us what's going on",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Attach File",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                TextFieldWidget(
                  readOnly: true,
                  controller: attachFileController,
                  hintText: "Upload file (Jpeg,pdf,png)",
                  keyboardType: TextInputType.name,
                  validator: (value) => AppValidation.validateName("AttachFile"),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Image.asset(
                      "assets/images/upload.png",
                      color: Theme.of(context).colorScheme.onSecondary,
                      height: 10,
                      width: 10,
                    ),
                  ),
                ),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: AppPaddings.all20,
        child: ActionButton(
          text: "Start Chat with Support",
          onPressed: () {
            if(_formKey.currentState!.validate())
              {
                Navigator.pushNamed(context, AppRoutes.youAreConnected);
              }
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
