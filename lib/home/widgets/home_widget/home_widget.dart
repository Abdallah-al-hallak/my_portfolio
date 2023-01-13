import 'package:flutter/material.dart';
import 'package:portfolio/utils/styles.dart';

import '../../../utils/colors.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> rightSize;
  late final Animation<double> topSize;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    )..forward();
    rightSize = Tween<double>(begin: -400, end: 0).animate(
      CurvedAnimation(
          parent: _controller, curve: Curves.fastLinearToSlowEaseIn),
    );
    topSize = Tween<double>(begin: -150, end: 210).animate(
      CurvedAnimation(
          parent: _controller, curve: Curves.fastLinearToSlowEaseIn),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('I build 1');
    var size = MediaQuery.of(context).size;

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            height: size.height,
            color: Colors.black,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  width: size.width / 2,
                  alignment: Alignment.centerRight,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12,
                        color: AppColors.dark,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: topSize.value,
                  right: rightSize.value,
                  child: Container(
                    height: 110,
                    width: 1000,
                    alignment: Alignment.center,
                    color: AppColors.yellow.withOpacity(0.09),
                    child: Text('ABDALLAH',
                        style: generalTextStyleWithOnyx(
                            110, AppColors.yellow1, 10)),
                  ),
                ),
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: const RelativeRect.fromLTRB(-100, -30, 0, 0),
                    end: RelativeRect.fromLTRB(
                        size.width / 2.1, size.height / 2.1, 200, 0),
                  ).animate(CurvedAnimation(
                    parent: _controller,
                    curve: Curves.fastLinearToSlowEaseIn,
                  )),
                  // top: size.height / 2.2,
                  // right: size.width / 3.5,
                  child: Text('AL HALLAK',
                      style: generalTextStyleWithOnyx(110, null, 10)),
                ),
              ],
            ),
          );
        });
  }
}
