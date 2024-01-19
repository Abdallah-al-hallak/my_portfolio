import 'package:flutter/material.dart';
import 'package:portfolio/animation/about_me_animation.dart';

import '../../../utils/colors.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height,
      color: AppColors.dark,
      child: const Column(
        children: [
          AboutMeAnimation(),
        ],
      ),
    );
  }
}
