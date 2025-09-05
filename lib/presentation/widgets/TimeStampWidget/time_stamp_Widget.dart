import 'package:flutter/material.dart';

Widget timeStamp(String time) {
  return Padding(
    padding: const EdgeInsets.only(top: 4, bottom: 4),
    child: Text(
      time,
      style: const TextStyle(fontSize: 12, color: Colors.grey),
    ),
  );
}