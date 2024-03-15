import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    Size size = MediaQuery.sizeOf(context);
    return LayoutBuilder(builder: (context, cons) {
      return SizeTransition(
        axis: Axis.horizontal,
        sizeFactor: containerSize,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.r),
          height: size.height - 200,
          color: AppColors.snow,
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: _controller,
            child: cons.maxWidth > 550
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widgets)
                : Column(
                    children: widgets,
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
    });
  }
}

List<Widget> widgets = [
  Container(
    child: Text(
      'ABOUT ME',
      textAlign: TextAlign.center,
      style: generalTextStyleWithOnyx(85.r, Colors.black),
    ),
  ),
  SizedBox(
    width: 35.0.r,
    height: 0.0,
  ),
  Expanded(
    child: Padding(
      padding: EdgeInsets.all(16.0.r),
      child: Container(
        // constraints: BoxConstraints(maxWidth: size.width / 1.5),
        child: SingleChildScrollView(
          child: Text(
            '''Hi, I'm Abdallah. 3 years experience in flutter development, driven by passion for pixel Perfect.Computer Science from Damascus University, with notable achievements in a lot of projects.Committed to personal and professional growth, always seeking new challenges. ''',
            textAlign: TextAlign.start,
            style: generalTextStyle(16.r, Colors.black),
          ),
        ),
      ),
    ),
  ),
];
