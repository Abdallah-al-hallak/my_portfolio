import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/data/model/projects_model.dart';

import '../../../data/project_data.dart';

class DesktopProjectsWidget extends StatefulWidget {
  const DesktopProjectsWidget({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  State<DesktopProjectsWidget> createState() => _DesktopProjectsWidgetState();
}

class _DesktopProjectsWidgetState extends State<DesktopProjectsWidget> {
  final ScrollController _pageController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.constraints.maxHeight,
      width: widget.constraints.maxWidth,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Projects I worked on',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: widget.constraints.maxHeight / 1.1,
            width: widget.constraints.maxWidth * .9,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: ProjectsData().project.length,
              itemBuilder: (context, index) {
                ProjectsModel data = ProjectsData().project[index];
                return ProjectCard(
                  index: index,
                  model: data,
                  constraints: widget.constraints,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard(
      {super.key,
      required this.constraints,
      required this.index,
      required this.model});
  final BoxConstraints constraints;
  final int index;
  final ProjectsModel model;
  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.constraints.maxWidth * .2,
      height: widget.constraints.maxHeight * .55,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(5),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Picture of project
              SizedBox(
                  height: widget.constraints.maxHeight * 0.1,
                  width: widget.constraints.maxWidth * 0.3,
                  child: Coverwidget(
                    photo: widget.model.photo1,
                  )),
              // Title of project
              // TitleWidget(text: widget.model.projectName),
              // Discreption
              const SizedBox(
                height: 10.0,
              ),
              DescriptionWidget(
                text: widget.model.description,
              ),
              Divider(
                color: Colors.white.withOpacity(0.3),
              ),

              IconWidget(
                model: widget.model,
              ),
              // Tools I used.
            ],
          )
        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.model});

  final ProjectsModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (model.photo2.isNotEmpty)
          InkWell(
            onTap: () {
              if (model.googleLink.isNotEmpty) {}
            },
            child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(model.photo2),
            ),
          ),
        if (model.photo3.isNotEmpty)
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: 35,
              height: 35,
              child: SvgPicture.asset(model.photo3),
            ),
          ),
        Text(
          'View Project',
          style: standardStyle(),
        )
      ],
    );
  }
}

class Coverwidget extends StatelessWidget {
  const Coverwidget({super.key, required this.photo});
  final String photo;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            photo,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      text,
      textAlign: TextAlign.center,
      style: standardStyle(),
    ));
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

TextStyle standardStyle() {
  return TextStyle(
    color: Colors.white,
  );
}
