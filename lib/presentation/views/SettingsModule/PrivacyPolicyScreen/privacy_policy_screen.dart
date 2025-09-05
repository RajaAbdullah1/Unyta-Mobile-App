import 'package:flutter/material.dart';
import 'package:unyta/presentation/widgets/CustomTitleAppBar/custom_title_appbar.dart';

import '../../../../core/styles/app_paddings.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTitleAppBar(title: "Privacy Policy"),
      body: Padding(
        padding: AppPaddings.horizontal16,
        child: Text(textAlign: TextAlign.left, """
       Lorem ipsum dolor sit amet consectetur adipiscing elit nisi per, sociosqu metus suscipit arcu euismod vulputate massa vel leo rutrum
       Porta et morbi euismod nec nostra est id montes dictumst interdum pulvinar nullam enim, senectus massa himenaeos dictum facilisi natoque ad blandit rhoncus vitae vestibulum feugiat, per magnis metus aptent molestie tincidunt nibh torquent fusce purus turpis mauris.
       tortor mattis suspendisse etiam gravida eros primis elementum. Dui eget potenti accumsan tortor aptent dapibus class ultrices litora, rutrum non odio in ridiculus mus senectus nisl, imperdiet magnis tristique integer ultricies porta morbi vulputate.

       Porta et morbi euismod nec nostra est id montes dictumst interdum pulvinar nullam enim, senectus massa himenaeos dictum facilisi natoque ad blandit rhoncus vitae vestibulum feugiat, per magnis metus aptent molestie tincidunt nibh torquent fusce purus turpis mauris.

       Porta et morbi euismod nec nostra est id montes dictumst interdum pulvinar nullam enim, senectus massa himenaeos dictum facilisi natoque ad blandit rhoncus vitae vestibulum feugiat, per magnis metus aptent molestie tincidunt nibh torquent fusce purus turpis mauris. 
        Porta et morbi euismod nec nostra est id montes dictumst interdum pulvinar nullam enim, senectus massa himenaeos dictum facilisi natoque ad blandit rhoncus vitae vestibulum feugiat, per magnis metus aptent molestie tincidunt nibh torquent fusce purus turpis mauris.
        """),
      ),
    );
  }
}
