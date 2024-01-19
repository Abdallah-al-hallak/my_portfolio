import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/animation/skills_widget_animation.dart';
import 'package:portfolio/home/blocs/projects_data_bloc/bloc/projects_data_bloc.dart';
import 'package:portfolio/home/blocs/scrolling_value/cubit/scrolling_value_cubit.dart';
import 'package:portfolio/home/providers/selected_bar_providers.dart';
import 'package:portfolio/home/view/prjects_view.dart';
import 'package:portfolio/home/widgets/projects_widgets/projects_widget.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../widgets/about_me_widget/about_me_widget.dart';
import '../widgets/contact_me_widget/contact_me_widget.dart';
import '../widgets/home_widget/home_widget.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProjectsDataBloc(),
        ),
        BlocProvider(
          create: (context) => ScrollingValueCubit(),
        )
      ],
      child: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Scaffold(
        drawer: constraint.maxWidth < 550 ? Drawer() : null,
        backgroundColor: Colors.black.withOpacity(0.9),
        body: CustomScrollView(
          controller: _scrollController,
          cacheExtent: 0,
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.dark.withOpacity(0.5),
              titleSpacing: 100,
              pinned: true,
              elevation: 0,
              actions: [
                if (constraint.maxWidth > 550)
                  PinnedAppBar(scrollController: _scrollController),
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              HomeWidget(scrollController: _scrollController),
              const AboutMeWidget(),
              const ProjectsWidgetGridView(),
              const SkillsWidgetAnimation(),
              const ContactMeWidget(),
            ]))
          ],
        ),
      );
    });
  }
}

class PinnedAppBar extends ConsumerStatefulWidget {
  const PinnedAppBar({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  ConsumerState<PinnedAppBar> createState() => _PinnedAppBarState();
}

class _PinnedAppBarState extends ConsumerState<PinnedAppBar> {
  var isHomeHoverd = false;
  var isAboutHoverd = false;
  var isProjectsHoverd = false;
  var isSkillsHoverd = false;
  var isContactHoverd = false;

  late double pos4;
  @override
  void initState() {
    widget.scrollController.addListener(() {
      pos4 = widget.scrollController.position.maxScrollExtent / 8;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selectedbar = ref.watch(selectedBarProvider);
    Size size = MediaQuery.sizeOf(context);
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        width: size.width / 10,
        child: TextButton(
          onHover: (value) {
            setState(() {
              isHomeHoverd = !isHomeHoverd;
            });
          },
          onPressed: () {
            ref.read(selectedBarProvider.notifier).state = SelectedBar.home;

            widget.scrollController.animateTo(0,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          child: Text(
            'Home',
            style: isHomeHoverd
                ? TextStyle(color: Colors.yellow, fontSize: size.width * 0.015)
                : generalTextStyle(
                    size.width * 0.012,
                    selectedbar == SelectedBar.home
                        ? AppColors.yellow
                        : Colors.white),
          ),
        ),
      ),
      SizedBox(width: size.width / 80, height: 0.0),
      SizedBox(
        width: size.width / 11,
        child: TextButton(
          onHover: (value) {
            setState(() {
              isAboutHoverd = !isAboutHoverd;
            });
          },
          onPressed: () {
            ref.read(selectedBarProvider.notifier).state = SelectedBar.about;
            widget.scrollController.animateTo(size.height,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          child: Text(
            'About me',
            style: isAboutHoverd
                ? TextStyle(
                    color: Colors.yellow,
                    fontSize: size.width * 0.015,
                  )
                : generalTextStyle(
                    size.width * 0.012,
                    selectedbar == SelectedBar.about
                        ? AppColors.yellow
                        : Colors.white),
          ),
        ),
      ),
      SizedBox(width: size.width / 80, height: 0.0),
      SizedBox(
        width: size.width / 11,
        child: TextButton(
          onHover: (value) {
            setState(() {
              isProjectsHoverd = !isProjectsHoverd;
            });
          },
          onPressed: () {
            ref.read(selectedBarProvider.notifier).state = SelectedBar.projects;
            widget.scrollController.animateTo(2 * size.height,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          child: Text(
            'Projects',
            style: isProjectsHoverd
                ? TextStyle(
                    color: Colors.yellow,
                    fontSize: size.width * 0.015,
                  )
                : generalTextStyle(
                    size.width * 0.012,
                    selectedbar == SelectedBar.projects
                        ? AppColors.yellow
                        : Colors.white),
          ),
        ),
      ),
      SizedBox(width: size.width / 80, height: 0.0),
      SizedBox(
        width: size.width / 11,
        child: TextButton(
          onHover: (value) {
            setState(() {
              isSkillsHoverd = !isSkillsHoverd;
            });
          },
          onPressed: () {
            ref.read(selectedBarProvider.notifier).state = SelectedBar.skills;
            widget.scrollController.animateTo(3 * size.height,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          child: Text(
            'Skills',
            style: isSkillsHoverd
                ? TextStyle(
                    color: Colors.yellow,
                    fontSize: size.width * 0.015,
                  )
                : generalTextStyle(
                    size.width * 0.012,
                    selectedbar == SelectedBar.skills
                        ? AppColors.yellow
                        : Colors.white),
          ),
        ),
      ),
      SizedBox(width: size.width / 80, height: 0.0),
      SizedBox(
        width: size.width / 11,
        child: TextButton(
          onHover: (value) {
            setState(() {
              isContactHoverd = !isContactHoverd;
            });
          },
          onPressed: () {
            ref.read(selectedBarProvider.notifier).state = SelectedBar.contact;
            widget.scrollController.animateTo(4 * size.height,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          child: Text(
            'Contact Me',
            style: isContactHoverd
                ? TextStyle(color: Colors.yellow, fontSize: size.width * 0.015)
                : generalTextStyle(
                    size.width * 0.012,
                    selectedbar == SelectedBar.contact
                        ? AppColors.yellow
                        : Colors.white),
          ),
        ),
      ),
      SizedBox(width: size.width / 18, height: 0.0),
    ]);
  }
}

enum SelectedBar {
  home,
  about,
  projects,
  skills,
  contact,
}
