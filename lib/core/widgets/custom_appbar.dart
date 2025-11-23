import 'package:flutter/material.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    title: Text(title),
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xFF1E1E1E),
  );
}
