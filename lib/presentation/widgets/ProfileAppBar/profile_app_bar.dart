import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isShowEdit;
  final VoidCallback? onBack;
  final VoidCallback? onEdit;
  final VoidCallback? onShare;

  const ProfileAppBar({
    super.key,
    this.onBack,
    this.onEdit,
    this.onShare,
    this.isShowEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: onBack ?? () => Navigator.pop(context),
      ),
      actions: [
        if(isShowEdit == true)
        IconButton(
          icon: Image.asset("assets/images/profile_edit.png",
              width: 32, height: 32),
          onPressed: onEdit,
        ),
        IconButton(
          icon: Image.asset("assets/images/profile_share.png",
              width: 32, height: 32),
          onPressed: onShare,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
