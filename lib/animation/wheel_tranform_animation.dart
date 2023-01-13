import 'package:flutter/material.dart';

class ScrollWheelAnimation extends StatefulWidget {
  final double tranformZ;
  final double tranformX;
  final Widget child;
  final double index;
  AnimationController controller;
  ScrollWheelAnimation({
    super.key,
    required this.tranformZ,
    required this.controller,
    required this.index,
    required this.child,
    required this.tranformX,
  });

  @override
  State<ScrollWheelAnimation> createState() => _ScrollWheelAnimationState();
}

class _ScrollWheelAnimationState extends State<ScrollWheelAnimation>
    with SingleTickerProviderStateMixin {
  late final Animation<double> tranformZ;
  late final Animation<double> tranformX;

  @override
  void initState() {
    super.initState();
    // widget.controller = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 600));

    tranformZ = Tween<double>(begin: widget.tranformZ, end: 0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0, widget.index, curve: Curves.ease),
      ),
    );
    tranformX = Tween<double>(begin: widget.tranformX, end: 0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0, widget.index, curve: Curves.ease),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      child: widget.child,
      builder: (context, child) {
        return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.005)
              ..rotateY(tranformZ.value)
              ..rotateX(tranformX.value),
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 250),
              tween: Tween<double>(
                begin: widget.tranformX,
                end: widget.tranformX,
              ),
              curve: Curves.easeOutBack,
              builder: (context, value, child) => Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.005)
                    ..rotateY(widget.tranformZ)
                    ..rotateX(widget.tranformX),
                  child: child),
              child: child,
            ));
      },
    );
  }
}
