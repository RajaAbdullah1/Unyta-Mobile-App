import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_paddings.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';

import '../../../widgets/SocialMediaLinkTile/social_media_link_tile.dart';

class SocialMediaLinksScreen extends StatefulWidget {
  const SocialMediaLinksScreen({super.key});

  @override
  State<SocialMediaLinksScreen> createState() => _SocialMediaLinksScreenState();
}

class _SocialMediaLinksScreenState extends State<SocialMediaLinksScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomTitleAppBar(
        title: "Social media links",
        subtitle: "Manage your social media here",
        height: size.height * 0.15,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SocialMediaLinkTile(
                imagePath: "assets/images/instagram.png",
                text: "@olivia_tweets",
              ),
              SizedBox(height: 20,),
              SocialMediaLinkTile(
                imagePath: "assets/images/tiktok.png",
                text: "@olivia_tweets",
              ),
              SizedBox(height: 20,),
              SocialMediaLinkTile(
                imagePath: "assets/images/youtube.png",
                text: "@olivia_tweets",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
