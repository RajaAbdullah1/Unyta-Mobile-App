import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../presentation/widgets/ShowDialog/show_dialog.dart';
import '../../routes/app_routes.dart';

class CreatorSelectedProvider extends ChangeNotifier{

  //******************** Alert Dialog ********************//
  Future<void> handleDialog(BuildContext context) async {
    final result = await showDialogWidget(
      context: context,
      title: "Set Campaign Live?",
    );
    if (result == true) {
      Navigator.pushNamed(context, AppRoutes.campaignStartedScreen);
    } else {
      debugPrint("❌ User pressed Cancel");
    }
  }

}