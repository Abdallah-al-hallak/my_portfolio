import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/data/project_data.dart';

import '../widgets/projects_widget_grid/projects_widget_grid.dart';

class ProjectsWidgetGridView extends StatelessWidget {
  const ProjectsWidgetGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProjectsCompleteView();
  }
}

class ProjectsCompleteView extends StatefulWidget {
  const ProjectsCompleteView({super.key});

  @override
  State<ProjectsCompleteView> createState() => _ProjectsCompleteViewState();
}

class _ProjectsCompleteViewState extends State<ProjectsCompleteView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height + 100.r,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 500) {
            return MobileProjectWidget(
              constraints: constraints,
            );
          }
          return DesktopProjectsWidget(
            constraints: constraints,
          );
        },
      ),
    );
  }
}

class MobileProjectWidget extends StatefulWidget {
  const MobileProjectWidget({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  State<MobileProjectWidget> createState() => _MobileProjectWidgetState();
}

class _MobileProjectWidgetState extends State<MobileProjectWidget> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              hoverColor: Colors.red,
              onTap: () {
                _controller.previousPage(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeIn);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 300.r,
              height: 350.r,
              child: PageView.builder(
                controller: _controller,
                itemCount: ProjectsData().project.length,
                itemBuilder: (context, index) => ProjectCard(
                    constraints: widget.constraints,
                    index: index,
                    model: ProjectsData().project[index]),
              ),
            ),
            InkWell(
              onTap: () {
                print(_controller.page);
                _controller.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn);
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
