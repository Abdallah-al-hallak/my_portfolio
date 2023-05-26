import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/animation/skills_widget_animation.dart';
import 'package:portfolio/home/blocs/projects_data_bloc/bloc/projects_data_bloc.dart';
import 'package:portfolio/home/blocs/scrolling_value/cubit/scrolling_value_cubit.dart';
import 'package:portfolio/home/providers/selected_bar_providers.dart';
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
    return CustomScrollView(
      controller: _scrollController,
      cacheExtent: 0,
      slivers: [
        SliverAppBar(
          backgroundColor: AppColors.dark,
          titleSpacing: 100,
          pinned: true,
          actions: [
            PinnedAppBar(scrollController: _scrollController),
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          HomeWidget(scrollController: _scrollController),
          const AboutMeWidget(),
          const ProjectsWidget(),
          const SkillsWidgetAnimation(),
          const ContactMeWidget(),
        ]))
      ],
    );
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
    var height = MediaQuery.of(context).size.height;
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        width: 100,
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
                ? const TextStyle(
                    color: Colors.yellow,
                    fontSize: 17,
                  )
                : generalTextStyle(
                    18,
                    selectedbar == SelectedBar.home
                        ? AppColors.yellow
                        : Colors.white),
          ),
        ),
      ),
      const SizedBox(width: 60.0, height: 0.0),
      SizedBox(
        width: 100,
        child: TextButton(
          onHover: (value) {
            setState(() {
              isAboutHoverd = !isAboutHoverd;
            });
          },
          onPressed: () {
            ref.read(selectedBarProvider.notifier).state = SelectedBar.about;
            widget.scrollController.animateTo(height,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          child: Text(
            'About me',
            style: isAboutHoverd
                ? const TextStyle(
                    color: Colors.yellow,
                    fontSize: 17,
                  )
                : generalTextStyle(
                    18,
                    selectedbar == SelectedBar.about
                        ? AppColors.yellow
                        : Colors.white),
          ),
        ),
      ),
      const SizedBox(width: 60.0, height: 0.0),
      SizedBox(
        width: 100,
        child: TextButton(
          onHover: (value) {
            setState(() {
              isProjectsHoverd = !isProjectsHoverd;
            });
          },
          onPressed: () {
            ref.read(selectedBarProvider.notifier).state = SelectedBar.projects;
            widget.scrollController.animateTo(2 * height,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          child: Text(
            'Projects',
            style: isProjectsHoverd
                ? const TextStyle(
                    color: Colors.yellow,
                    fontSize: 17,
                  )
                : generalTextStyle(
                    18,
                    selectedbar == SelectedBar.projects
                        ? AppColors.yellow
                        : Colors.white),
          ),
        ),
      ),
      const SizedBox(width: 60.0, height: 0.0),
      SizedBox(
        width: 100,
        child: TextButton(
          onHover: (value) {
            setState(() {
              isSkillsHoverd = !isSkillsHoverd;
            });
          },
          onPressed: () {
            ref.read(selectedBarProvider.notifier).state = SelectedBar.skills;
            widget.scrollController.animateTo(3 * height,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          child: Text(
            'Skills',
            style: isSkillsHoverd
                ? const TextStyle(
                    color: Colors.yellow,
                    fontSize: 17,
                  )
                : generalTextStyle(
                    18,
                    selectedbar == SelectedBar.skills
                        ? AppColors.yellow
                        : Colors.white),
          ),
        ),
      ),
      const SizedBox(width: 60.0, height: 0.0),
      SizedBox(
        width: 110,
        child: TextButton(
          onHover: (value) {
            setState(() {
              isContactHoverd = !isContactHoverd;
            });
          },
          onPressed: () {
            ref.read(selectedBarProvider.notifier).state = SelectedBar.contact;
            widget.scrollController.animateTo(4 * height,
                duration: const Duration(seconds: 1), curve: Curves.ease);
          },
          child: Text(
            'Contact Me',
            style: isContactHoverd
                ? const TextStyle(
                    color: Colors.yellow,
                    fontSize: 17,
                  )
                : generalTextStyle(
                    18,
                    selectedbar == SelectedBar.contact
                        ? AppColors.yellow
                        : Colors.white),
          ),
        ),
      ),
      const SizedBox(width: 120.0, height: 0.0),
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
