import 'package:flutter/cupertino.dart';
import 'package:portfolio/utils/colors.dart';

TextStyle generalTextStyle([dynamic size, color]) {
  return TextStyle(
    color: color ?? AppColors.snow,
    fontSize: 20,
  ).copyWith(fontSize: size);
}

TextStyle generalTextStyleWithOnyx([dynamic size, color, spacing]) {
  return TextStyle(
    color: color ?? AppColors.snow,
    fontSize: 20,
    letterSpacing: spacing,
    fontFamily: 'ONYX',
  ).copyWith(fontSize: size);
}
