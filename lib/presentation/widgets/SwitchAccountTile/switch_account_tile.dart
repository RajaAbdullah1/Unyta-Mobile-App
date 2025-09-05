import 'package:flutter/material.dart';

class SwitchAccountTile extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? username;
  final bool isSelected;
  final bool isAddTile;
  final VoidCallback? onTap;

  const SwitchAccountTile({
    super.key,
    this.imagePath,
    this.name,
    this.username,
    this.isSelected = false,
    this.isAddTile = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surfaceBright,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide.none,
      ),
      leading: isAddTile
          ? Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.surfaceDim,
          ),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.surfaceBright,
          child:  Icon(Icons.add, color: Theme.of(context).colorScheme.primary,),
        ),
      )
          : CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(imagePath!),
      ),
      title: Text(
        isAddTile ? "Add account" : name ?? "",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: isAddTile
          ? null
          : Text(
        username ?? "",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      trailing: isSelected
          ? GestureDetector(
        onTap: onTap,
        child: Image.asset(
          "assets/images/check.png",
          width: 30,
          height: 30,
        ),
      )
          : null,
    );
  }
}
