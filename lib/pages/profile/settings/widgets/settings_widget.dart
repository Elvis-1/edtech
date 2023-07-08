import 'package:flutter/material.dart';

AppBar buildAppbar() {
  return AppBar(
    title: const Text(
      "Settings",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
  );
}
