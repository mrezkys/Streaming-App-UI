import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListGradient {
  final LinearGradient appBackgroundColor = LinearGradient(colors: [Color(0xFF171D31), Color(0xFF0B0D14)], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  final LinearGradient buttonBackgroundColor = LinearGradient(colors: [Color(0xFF31A4C8), Color(0xFF1B7794)], begin: Alignment.topLeft, end: Alignment.topRight);
  final Shader textGradient =
      LinearGradient(colors: [Color(0xFF31A4C8), Color(0xFF1B7794)], begin: Alignment.centerLeft, end: Alignment.centerRight).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
