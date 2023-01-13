import 'package:flutter/animation.dart';
import 'package:portfolio/utils/colors.dart';

class SkillsAnimationCode {
  SkillsAnimationCode(this.controller, this.controller2)
      : whiteContainer = Tween<double>(
          begin: 500,
          end: 620,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              .5,
              1,
              curve: Curves.easeIn,
            ),
          ),
        ),
        opacityYellowContainer = Tween<double>(
          begin: 1,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: controller2,
            curve: const Interval(
              0,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        textColor =
            ColorTween(begin: AppColors.yellow, end: AppColors.snow).animate(
          CurvedAnimation(
            parent: controller2,
            curve: const Interval(
              .5,
              1,
              curve: Curves.easeIn,
            ),
          ),
        );
  final AnimationController controller;
  final AnimationController controller2;
  final Animation<double> whiteContainer;
  final Animation<Color?> textColor;
  final Animation<double> opacityYellowContainer;
}
