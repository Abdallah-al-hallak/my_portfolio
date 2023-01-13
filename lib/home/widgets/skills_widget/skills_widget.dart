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
      color: Colors.black,
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
                      builder: (context, child) {
                        return Container(
                          alignment: Alignment.center,
                          constraints: const BoxConstraints(
                            maxWidth: 275,
                          ),
                          child: Text(
                            'What Skills Do I Have ?',
                            style: generalTextStyleWithOnyx(
                                80, widget.code.textColor.value),
                          ),
                        );
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
