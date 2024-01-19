import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/utils/styles.dart';
import '../../../utils/colors.dart';

class HomeWidget extends StatefulWidget {
  final ScrollController scrollController;
  const HomeWidget({super.key, required this.scrollController});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> rightPos;
  late final Animation<double> topPos;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      reverseDuration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    rightPos = Tween<double>(begin: -400, end: 0).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastLinearToSlowEaseIn),
    );
    topPos = Tween<double>(begin: -150, end: 210).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastLinearToSlowEaseIn),
    );
    widget.scrollController.addListener(() {
      var t = widget.scrollController.position.maxScrollExtent / 12;
      if (!mounted) return;
      if (widget.scrollController.offset >= t) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              height: size.height,
              color: AppColors.dark,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Positioned(
                    left: size.width / 8.5,
                    child: Container(
                        width: size.width / 2,
                        alignment: Alignment.center,
                        child: Image.asset('assets/imgs/abd.png')
                            .animate()
                            .fade(duration: 700.milliseconds)),
                  ),
                  Container(
                    width: size.width / 2,
                    decoration: const BoxDecoration(
                      color: AppColors.dark,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 20,
                          color: AppColors.dark,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: topPos.value,
                    right: rightPos.value,
                    child: Container(
                        height: size.height / 5.5,
                        width: size.width / 1.3,
                        alignment: Alignment.center,
                        color: AppColors.yellow.withOpacity(0.09),
                        child: Text('ABDALLAH',
                            style: generalTextStyleWithOnyx(
                                size.width / 15, AppColors.yellow1, 10.0))),
                  ),
                  PositionedTransition(
                    rect: RelativeRectTween(
                      begin: const RelativeRect.fromLTRB(-100, -30, 0, 0),
                      end: RelativeRect.fromLTRB(
                          size.width / 2, size.height / 2.1, 0, 0),
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.fastLinearToSlowEaseIn,
                    )),
                    // top: size.height / 2.2,
                    // right: size.width / 3.5,
                    child: Text('AL HALLAK',
                        style: generalTextStyleWithOnyx(
                            size.width / 15, null, 10.0)),
                  ),
                ],
              ),
            );
          });
    });
  }
}
