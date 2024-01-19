import 'package:flutter/material.dart';

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
      height: size.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Text('mobile');
          }
          if (constraints.maxWidth > 600) {
            return DesktopProjectsWidget(
              constraints: constraints,
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
