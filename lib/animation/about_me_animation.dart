import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';

class AboutMeAnimation extends StatefulWidget {
  const AboutMeAnimation({
    super.key,
  });

  @override
  State<AboutMeAnimation> createState() => _AboutMeAnimationState();
}

class _AboutMeAnimationState extends State<AboutMeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> textOffset;
  late Animation<double> containerSize;
  late Animation<double> textOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
    containerSize = Tween<double>(
      begin: 0,
      end: 10,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.8, curve: Curves.easeIn),
      ),
    );
    textOffset = Tween<double>(
      begin: 100,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    textOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.ease),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizeTransition(
      axis: Axis.horizontal,
      sizeFactor: containerSize,
      child: Container(
        height: size.height - 200,
        color: AppColors.snow,
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: _controller,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 200,
                ),
                child: Text(
                  'ABOUT ME',
                  textAlign: TextAlign.start,
                  style: generalTextStyleWithOnyx(110.0, Colors.black),
                ),
              ),
              const SizedBox(
                width: 35.0,
                height: 0.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  constraints: BoxConstraints(maxWidth: size.width / 2),
                  child: Text(
                    '''Hi, I'm Abdallah. 3 years experience in flutter development, driven by passion for pixel Perfect.Computer Science from Damascus University, with notable achievements in a lot of projects.Committed to personal and professional growth, always seeking new challenges. ''',
                    textAlign: TextAlign.start,
                    style: generalTextStyle(22, Colors.black),
                  ),
                ),
              ),
            ],
          ),
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, textOffset.value),
              child: Opacity(opacity: textOpacity.value, child: child),
            );
          },
        ),
      ),
    );
  }
}
