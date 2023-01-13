import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/home/blocs/projects_data_bloc/bloc/projects_data_bloc.dart';
import 'package:portfolio/home/blocs/scrolling_value/cubit/scrolling_value_cubit.dart';

import 'package:portfolio/home/widgets/projects_widgets/projects_widget.dart';
import 'package:portfolio/home/widgets/skills_widget/skills_widget.dart';

import '../../animation/skills_widget_animation.dart';
import '../widgets/about_me_widget/about_me_widget.dart';
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
        ),
      ],
      child: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      cacheExtent: 0,
      children: const [
        HomeWidget(),
        AboutMeWidget(),
        ProjectsWidget(),
        SkillsWidgetAnimation(),
      ],
    );
  }
}
