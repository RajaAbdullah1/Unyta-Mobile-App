import 'package:flutter/material.dart';

import '../../../widgets/TextFieldWidget/text_field_widget.dart';

class MapSearchScreen extends StatefulWidget {
  const MapSearchScreen({super.key});

  @override
  State<MapSearchScreen> createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      toolbarHeight: size.height * 0.1,
      leading: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back)),
      title: TextFieldWidget( controller: controller,hintText: "Search", keyboardType: TextInputType.text,fillColor: Theme.of(context).colorScheme.surfaceDim , prefixIcon: Padding( padding: const EdgeInsets.only(left: 10.0, right: 10), child: Image.asset( "assets/images/search.png", height: 10, width: 10,), ), validator: (p0) { return null; }, ),
    );
  }
}
