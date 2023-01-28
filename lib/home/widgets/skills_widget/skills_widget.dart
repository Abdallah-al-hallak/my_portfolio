import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/animation/skills_animation_code.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/styles.dart';

class SkillsWidget extends StatefulWidget {
  SkillsWidget({super.key, required this.controller, required this.controller2})
      : code = SkillsAnimationCode(controller, controller2);
  final AnimationController controller;
  final AnimationController controller2;
  final SkillsAnimationCode code;

  @override
  State<SkillsWidget> createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size;
    return Container(
      color: AppColors.dark,
      height: height.height,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                      animation: widget.controller2,
                      child: const SkillsWidgetCirclesScaled(),
                      builder: (context, child) {
                        return Container(
                            alignment: Alignment.center,
                            constraints: const BoxConstraints(
                              maxWidth: 275,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'What Skills Do I Have ?',
                                  textAlign: TextAlign.center,
                                  style: generalTextStyleWithOnyx(
                                      80.0, widget.code.textColor.value),
                                ),
                                child!,
                              ],
                            ));
                      }),
                ],
              )),
          Expanded(
            flex: 3,
            child: AnimatedBuilder(
              animation:
                  Listenable.merge([widget.controller, widget.controller2]),
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: widget.code.whiteContainer.value,
                      height: widget.code.whiteContainer.value,
                      decoration: BoxDecoration(
                        color: AppColors.dark,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 40,
                            color: AppColors.snow,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 62,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: widget.code.opacityYellowContainer.value,
                      child: Container(
                        alignment: Alignment.center,
                        width: 500,
                        height: 500,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 35,
                              color: AppColors.yellow,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.yellow1,
                            width: 62,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 800,
                      height: 800,
                      child: Image.asset('assets/imgs/abdul.png'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsCircleWrapper extends StatefulWidget {
  final double intervalStart;
  final Widget child;
  const SkillsCircleWrapper(
      {super.key, required this.intervalStart, required this.child});

  @override
  State<SkillsCircleWrapper> createState() => _SkillsCircleWrapperState();
}

class _SkillsCircleWrapperState extends State<SkillsCircleWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late final Animation<double> scaleTransistion;
  late final Animation<double> fadeAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    Future.delayed(
      const Duration(milliseconds: 300),
      () => _animationController.forward(),
    );
    Curve intervalCurve = Interval(
      widget.intervalStart,
      1,
      curve: Curves.easeInOutBack,
    );
    scaleTransistion = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: intervalCurve,
      ),
    );
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: intervalCurve,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: widget.child,
      builder: (context, child) {
        return ScaleTransition(
          scale: scaleTransistion,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }
}

class SkillsWidgetCirclesScaled extends StatelessWidget {
  const SkillsWidgetCirclesScaled({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.builder(
        clipBehavior: Clip.hardEdge,
        itemCount: SkillsCirclesData.list.length,
        itemBuilder: (
          context,
          index,
        ) {
          var g = SkillsCirclesData.list[index];
          return SkillsCircleWrapper(
            intervalStart: index / 5,
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.snow,
              ),
              child: SizedBox(
                width: 30,
                child: Image.asset(
                  g.skillPhoto,
                  width: 30,
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1.5),
      ),
    );
  }
}

class SkillsCircleModel extends Equatable {
  final String skillPhoto;
  final String skillName;
  const SkillsCircleModel({
    required this.skillPhoto,
    required this.skillName,
  });

  @override
  List<Object?> get props => [skillName, skillPhoto];
}

class SkillsCirclesData {
  static List<SkillsCircleModel> list = const [
    SkillsCircleModel(
        skillPhoto: 'assets/imgs/django.png', skillName: 'django'),
    SkillsCircleModel(
        skillPhoto: 'assets/imgs/docker.png', skillName: 'docker'),
    SkillsCircleModel(
        skillPhoto: 'assets/imgs/flutter.png', skillName: 'flutter'),
    SkillsCircleModel(
        skillPhoto: 'assets/imgs/nodejs.png', skillName: 'nodejs'),
  ];
}
