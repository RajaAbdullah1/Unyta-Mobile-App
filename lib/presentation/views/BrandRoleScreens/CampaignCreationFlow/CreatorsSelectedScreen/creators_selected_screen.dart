import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import '../../../../../provider/CreatorSelectedProvider/creator_selected_provider.dart';
import '../../../../widgets/ActionButton/action_button.dart';
import '../../../../widgets/NewCreatorCard/new_creator_card.dart';

class CreatorsSelectedScreen extends StatefulWidget {
  const CreatorsSelectedScreen({super.key});

  @override
  State<CreatorsSelectedScreen> createState() => _CreatorsSelectedScreenState();
}

class _CreatorsSelectedScreenState extends State<CreatorsSelectedScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreatorSelectedProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Creators Selected",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "You campaign is live! Now it's time to deliver your offer.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              SizedBox(height: 30),
              CreatorCard(
                name: "Olivia Jen",
                username: "@olivia.style",
                imagePath: "assets/images/match.png",
                onTap: () {
                  debugPrint("View Profile clicked for Olivia Jen");
                },
                buttonLabel: "Chat",
              ),
              SizedBox(height: 10),
              CreatorCard(
                name: "Olivia Jen",
                username: "@olivia.style",
                imagePath: "assets/images/match.png",
                onTap: () => provider.handleDialog(context),
                buttonLabel: "Select",
              ),
              SizedBox(height: 20),
              ActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                },
                text: "Start Campaign",
              ),
              SizedBox(height: 10),
              ActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                borderColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                },
                text: "Select More Creators",
              ),
              SizedBox(height: 10),
              ActionButton(
                backgroundColor: Theme.of(context).colorScheme.surfaceDim,
                borderColor: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.primary,
                onPressed: () {},
                text: "Back To Home Page",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
