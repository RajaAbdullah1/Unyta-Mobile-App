import 'package:flutter/material.dart';

Widget bulletImageText(BuildContext context, String text){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset("assets/images/bullet_star.png", height: 20,width: 20,),
      SizedBox(width: 10,),
      Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSecondary)))
    ],
  );
}