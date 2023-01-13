import 'package:flutter/material.dart';
import 'package:portfolio/home/widgets/skills_widget/skills_widget.dart';

class SkillsWidgetAnimation extends StatefulWidget {
  const SkillsWidgetAnimation({super.key});

  @override
  State<SkillsWidgetAnimation> createState() => _SkillsWidgetAnimationState();
}

class _SkillsWidgetAnimationState extends State<SkillsWidgetAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> whiteConainer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1300,
      ),
    )..forward();
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1100,
      ),
    );
    _controller.addListener(() async {
      if (_controller.isCompleted) {
        await Future.delayed(const Duration(milliseconds: 200));
        _controller2.forward();
        await Future.delayed(const Duration(milliseconds: 100));
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SkillsWidget(
      controller: _controller,
      controller2: _controller2,
    );
  }
}
