import 'package:flutter/material.dart';
import 'package:portfolio/animation/about_me_animation.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('I build 2');
    var height = MediaQuery.of(context).size;
    return Container(
      height: height.height,
      color: Colors.black,
      child: Column(
        children: const [
          AboutMeAnimation(),
        ],
      ),
    );
  }
}
