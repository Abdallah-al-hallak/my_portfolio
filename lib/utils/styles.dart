import 'package:flutter/cupertino.dart';
import 'package:portfolio/utils/colors.dart';

TextStyle generalTextStyle([double? size = 0.0, color]) {
  return TextStyle(
    color: color ?? AppColors.snow,
    fontSize: 20,
  ).copyWith(fontSize: double.parse(size.toString()));
}

TextStyle generalTextStyleWithOnyx([double? size, color, spacing]) {
  return TextStyle(
    color: color ?? AppColors.snow,
    fontSize: 20,
    letterSpacing: spacing,
    fontFamily: 'ONYX',
  ).copyWith(fontSize: size);
}
