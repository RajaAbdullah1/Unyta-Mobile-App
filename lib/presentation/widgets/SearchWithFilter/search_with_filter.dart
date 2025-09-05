import 'package:flutter/material.dart';

import '../../../routes/app_routes.dart';
import '../TextFieldWidget/text_field_widget.dart';

class SearchWithFilter extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onFilterPressed;

  const SearchWithFilter({
    super.key,
    required this.controller,
    this.hintText = "Search",
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: TextFieldWidget( readOnly: true, onTap: () {
            Navigator.pushNamed(context, AppRoutes.mapSearchScreen);
          },controller: controller, hintText: hintText, keyboardType: TextInputType.text, prefixIcon: Padding( padding: const EdgeInsets.only(left: 10.0, right: 10), child: Image.asset( "assets/images/search.png", height: 10, width: 10, ), ), validator: (p0) { return null; }, ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Theme.of(context).colorScheme.surfaceDim,
              ),
            ),
            child: IconButton(
              onPressed: onFilterPressed,
              icon: Image.asset("assets/images/filters.png"),
            ),
          ),
        ),
      ],
    );
  }
}
