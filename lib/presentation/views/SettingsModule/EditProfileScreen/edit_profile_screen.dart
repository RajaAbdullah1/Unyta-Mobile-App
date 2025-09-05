import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import 'package:unyta/presentation/widgets/TextFieldWidget/text_field_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    instagramController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Edit Profile",
        subtitle: "Manage your settings here",
        height: size.height * 0.15,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: size.height * 0.08,
                    backgroundImage: AssetImage(
                      "assets/images/Image profile.png",
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 20, // circle ka size
                      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                      child: Image.asset(
                        "assets/images/edit_pen.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                controller: nameController,
                hintText: "Olivia Style",
                keyboardType: TextInputType.name,
                validator: (p0) {
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                controller: instagramController,
                hintText: "@olivia.style",
                keyboardType: TextInputType.text,
                validator: (p0) {
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
