import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/data/project_data.dart';
import 'package:portfolio/home/blocs/projects_data_bloc/bloc/projects_data_bloc.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/styles.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({super.key});

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget>
    with TickerProviderStateMixin {
  final ScrollController scrollController =
      ScrollController(keepScrollOffset: true, initialScrollOffset: 50);

  late AnimationController _controller;
  late AnimationController _controller2;
  late final Animation<double> tranformZ;
  late final Animation<AlignmentGeometry?> alignmentG;
  late final Animation<double> tranformX;

  double itemHeight = 320;

  double topContainrr = 0;

  @override
  void initState() {
    // _scrollToBottom();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..forward();
    _controller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450))
      ..forward();
    alignmentG = AlignmentGeometryTween(
            begin: Alignment.center, end: Alignment.centerLeft)
        .animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );
    tranformZ = Tween<double>(begin: 0, end: 0.045).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: const Interval(
          0.5,
          1,
          curve: Curves.easeIn,
        ),
      ),
    );

    scrollController.addListener(() {
      // double value = scrollController.offset / 350;
      double value = scrollController.position.pixels;

      topContainrr = value;

      setState(() {});
    });

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
          // 1️⃣ the projects wheel view
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Stack(fit: StackFit.loose, children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(left: 120),
                        constraints: const BoxConstraints(maxWidth: 180),
                        child: Text(
                          'Projects I worked on',
                          textAlign: TextAlign.center,
                          style: generalTextStyleWithOnyx(75.0),
                        ),
                      ),
                    ),
                    Positioned(
                      height: height.width / 1.35,
                      width: height.width / 1.35,
                      left: -height.width / 2.4,
                      top: -300,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 4, color: AppColors.snow)),
                      ),
                    ),
                    ClickableListWheelScrollView(
                      scrollOnTap: true,
                      loop: true,
                      scrollController: scrollController,
                      itemHeight: itemHeight,
                      itemCount: 5,
                      onItemTapCallback: (index) async {
                        _controller.forward();
                        _controller2.reverse();
                      },
                      child: ListWheelScrollView.useDelegate(
                        physics: const NeverScrollableScrollPhysics(),
                        itemExtent: itemHeight,
                        diameterRatio: 30,
                        overAndUnderCenterOpacity: 1,
                        offAxisFraction: 0,
                        scrollBehavior: const ScrollBehavior(),
                        controller: scrollController,
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: ProjectsData().project.length,
                          builder: (context, index) {
                            var data = ProjectsData().project[index];

                            double rotationAngle = 0;

                            double rotationAngleX = 0;
                            double scale = 0;
                            if (topContainrr == index * itemHeight) {
                              context.read<ProjectsDataBloc>().add(
                                    ProjectsDataEvent.started(
                                        proojectsModel: data),
                                  );
                              rotationAngle = 0;
                              rotationAngleX = 0;
                              scale = 1;
                            } else if (topContainrr < index * itemHeight) {
                              rotationAngle = -0.11 + index / 100;
                              rotationAngleX = -0.035;
                              scale = 0.6;
                            } else if (topContainrr > index * itemHeight) {
                              rotationAngle = (0.11 + index / 100);
                              rotationAngleX = 0.025;
                              scale = 0.6;
                            }

                            return Stack(
                              children: [
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: topContainrr == index * itemHeight
                                      ? 1
                                      : 0,
                                  child: RotationTransition(
                                    turns: tranformZ,
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      width: 900,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 0),
                                      margin: EdgeInsets.only(
                                        left: 200,
                                        right:
                                            topContainrr == index * itemHeight
                                                ? 0
                                                : 220,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          data.photo2,
                                          width: 450,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TweenAnimationBuilder<double>(
                                  duration: const Duration(milliseconds: 150),
                                  tween:
                                      Tween<double>(begin: scale, end: scale),
                                  curve: Curves.easeOutBack,
                                  builder: (context, value, child) =>
                                      Transform.scale(
                                    alignment: Alignment.center,
                                    scale: value,
                                    child: child,
                                  ),
                                  child: TweenAnimationBuilder(
                                    duration: const Duration(milliseconds: 150),
                                    tween: Tween<double>(
                                      begin: 0,
                                      end: rotationAngle,
                                    ),
                                    curve: Curves.easeInOut,
                                    builder: (context, value, child) =>
                                        Transform(
                                            transform: Matrix4.identity()
                                              ..rotateY(rotationAngle)
                                              ..rotateX(rotationAngleX),
                                            child: child),
                                    child: Container(
                                      width: 1000,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 0),
                                      margin: EdgeInsets.only(
                                        left: 190,
                                        right:
                                            topContainrr == index * itemHeight
                                                ? 0
                                                : 220,
                                      ),
                                      alignment: Alignment.topCenter,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          data.photo1,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          // 2️⃣the desc about projext
          BlocConsumer<ProjectsDataBloc, ProjectsDataState>(
            listener: (context, state) {
              _controller.reset();
              _controller2.forward();
            },
            builder: (context, state) {
              return AnimatedBuilder(
                animation: _controller,
                child: Expanded(
                  flex: 1,
                  child: Container(
                    alignment: alignmentG.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          state.proojectsModel?.projectName ?? '',
                          style: generalTextStyleWithOnyx(70.0),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 350,
                          ),
                          child: Text(
                            state.proojectsModel?.description ?? '',
                            textAlign: TextAlign.center,
                            softWrap: true,
                            strutStyle: const StrutStyle(height: 2),
                            style: generalTextStyle(20),
                          ),
                        ),
                        const SizedBox(width: 0.0, height: 50.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.snow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minimumSize: const Size(140, 50),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'open website',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                builder: (context, child) {
                  return child!;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
