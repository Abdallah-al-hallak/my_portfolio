import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  void dispose() {
    widget.controller.dispose();
    widget.controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size;
    return Container(
      color: AppColors.dark,
      height: height.height * 1.7,
      child: Column(
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
                        QuestionWidget(
                          color: widget.code.textColor.value,
                        ),
                        child!,
                      ],
                    ));
              }),
          SizedBox(width: 0.0, height: 15.0.r),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: RelativeSkillsWidget(
                    color: widget.code.textColor.value,
                  )),
              CirclePictureWidget(
                code: widget.code,
                controller2: widget.controller2,
                controller: widget.controller,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.color});
  final Color? color;
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'What Skills Do I Have ?',
      textAlign: TextAlign.center,
      style: generalTextStyleWithOnyx(65.0.r, widget.color),
    );
  }
}

class CirclePictureWidget extends StatefulWidget {
  const CirclePictureWidget(
      {super.key,
      required this.code,
      required this.controller,
      required this.controller2});
  final SkillsAnimationCode code;
  final AnimationController controller;
  final AnimationController controller2;
  @override
  State<CirclePictureWidget> createState() => _CirclePictureWidgetState();
}

class _CirclePictureWidgetState extends State<CirclePictureWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: AnimatedBuilder(
        animation: Listenable.merge([widget.controller, widget.controller2]),
        builder: (context, child) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                alignment: Alignment.topCenter,
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
                  alignment: Alignment.topCenter,
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
                child: Image.asset('assets/imgs/abdul.png',
                    alignment: Alignment.topCenter),
              ),
            ],
          );
        },
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
      height: 190.r,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.hardEdge,
        itemCount: SkillsCirclesData.list.length,
        itemBuilder: (
          context,
          index,
        ) {
          var g = SkillsCirclesData.list[index];
          return SkillsCircleWrapper(
            intervalStart: index / 5,
            child: Column(
              children: [
                Container(
                  width: 55.r,
                  height: 55.r,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.snow,
                  ),
                  child: SizedBox(
                    width: 50.r,
                    child: Image.asset(
                      g.skillPhoto,
                      width: 40.r,
                    ),
                  ),
                ),
                Text(
                  g.skillName,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.r,
            mainAxisSpacing: 12.r,
            childAspectRatio: 1),
      ),
    );
  }
}

class RelativeSkillsWidget extends StatelessWidget {
  const RelativeSkillsWidget({super.key, required this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      double fontSize = constraint.maxWidth > 500 ? 20.r : 15.r;
      var style = TextStyle(color: Colors.white, fontSize: fontSize);
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Relative Skills:',
              textAlign: TextAlign.center,
              style: generalTextStyleWithOnyx(35.0.r, color),
            ),
            Text(
              ' - Advanced Dart Programming',
              textAlign: TextAlign.center,
              style: style,
            ),
            SizedBox(width: 0.0, height: 5.0.r),
            Text(
              ' - Custom UI/UX design with flutter',
              textAlign: TextAlign.center,
              style: style,
            ),
            SizedBox(width: 0.0, height: 5.0.r),
            Text(
              ' - State management(Bloc, Provider, riverpod)',
              textAlign: TextAlign.center,
              style: style,
            ),
            SizedBox(width: 0.0, height: 5.0.r),
            Text(
              ' - RESTFul and GraphQL API Integration',
              textAlign: TextAlign.center,
              style: style,
            ),
            SizedBox(width: 0.0, height: 5.0.r),
            Text(
              ' - Unit, widget and integration test',
              textAlign: TextAlign.center,
              style: style,
            ),
            SizedBox(width: 0.0, height: 5.0.r),
            Text(
              ' - CI/CD with Codemagic and microsoft AZURE',
              textAlign: TextAlign.center,
              style: style,
            ),
            SizedBox(width: 0.0, height: 5.0.r),
            Text(
              ' Version control with Git',
              textAlign: TextAlign.center,
              style: style,
            ),
            SizedBox(width: 0.0, height: 5.0.r),
            Text(
              ' Agile development methodologies',
              textAlign: TextAlign.center,
              style: style,
            ),
          ],
        ),
      );
    });
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
        skillPhoto: 'assets/imgs/flutter.png', skillName: 'Flutter'),
    SkillsCircleModel(skillPhoto: 'assets/imgs/sql.png', skillName: 'SQL'),
    SkillsCircleModel(
        skillPhoto: 'assets/imgs/firebase.png', skillName: 'FireBase'),
    SkillsCircleModel(
        skillPhoto: 'assets/imgs/nodejs.png', skillName: 'NestJs'),
    SkillsCircleModel(
        skillPhoto: 'assets/imgs/postgresql.png', skillName: 'postgreSQL'),
    SkillsCircleModel(
        skillPhoto: 'assets/imgs/docker.png', skillName: 'docker'),
  ];
}
