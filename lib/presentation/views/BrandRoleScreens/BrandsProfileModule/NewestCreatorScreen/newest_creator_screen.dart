import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';
import '../../../../widgets/NewCreatorCard/new_creator_card.dart';

class NewestCreatorScreen extends StatefulWidget {
  const NewestCreatorScreen({super.key});

  @override
  State<NewestCreatorScreen> createState() => _NewestCreatorScreenState();
}

class _NewestCreatorScreenState extends State<NewestCreatorScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(title: "Newest Creators", subtitle: "New Creators that joined recently", height: size.height * 0.16,),
      body: ListView(
        physics: PageScrollPhysics(),
        padding: AppPaddings.all16,
        children: [
          ...List.generate(5, (index) {
            return Column(
              children: [
                CreatorCard(
                  name: "Olivia Jen",
                  username: "@olivia.style",
                  imagePath: "assets/images/match.png",
                  onTap: () {
                    debugPrint("View Profile clicked for Olivia Jen");
                  },
                ),
                SizedBox(height: 10),
              ],
            );
          }),
        ],
      ),
    );
  }
}
