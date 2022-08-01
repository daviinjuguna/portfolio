import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/launch_url.dart';
import 'package:portfolio/utils/responsive.dart';

import '../../../../model/project_model.dart';
import 'project_card.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Projects",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: kDefaultPadding),
          Responsive(
            mobile: _ProjectsGridView(
              crossAxisCount: 1,
              childAspectRatio: 1.7,
            ),
            mobileLarge: _ProjectsGridView(crossAxisCount: 2),
            tablet: _ProjectsGridView(childAspectRatio: 1.1),
            desktop: _ProjectsGridView(),
          )
        ],
      );
}

class _ProjectsGridView extends StatelessWidget {
  const _ProjectsGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: kDefaultPadding,
        mainAxisSpacing: kDefaultPadding,
      ),
      itemBuilder: (context, index) => ProjectCard(
        project: _projects[index],
        open: () => LaunchUrl.launch(_projects[index].url),
      ),
    );
  }
}

List<ProjectModel> _projects = [
  ProjectModel(
    title: "Learn to Drill - Flutter",
    description:
        "Learn to drill is a drilling simulation software. The app was designed and build with flutter and firebase. Its fully responsive and available for Android, Ios and Web",
    url: LTD,
  ),
  ProjectModel(
    title: "Sortika - Flutter and Django",
    description:
        "Sortika is a personal wealth management. We designed the frontend with flutter and backend with django",
    url: SORTIKA,
  ),
  ProjectModel(
    title: "Ebebewa - Android Java",
    description: "Android application with RxJava, Dagger 2",
    url: EBEBEWA,
  ),
  ProjectModel(
    title: "Animated Bottom View - Flutter",
    description: "Using flutter and rive for animations",
    url: "https://github.com/daviinjuguna/animated_bottom_view.git",
  ),
  ProjectModel(
    title: "Kotlin Hilt - Kotlin",
    description: "Using kotlin and hilt to make clean architecture app",
    url: "https://github.com/daviinjuguna/rickandmortyhiltcleancodekotlin.git",
  ),
  ProjectModel(
    title: "Farmer Local - Flutter",
    description: "Using Flutter Moor, local sql to create the app",
    url: "https://github.com/daviinjuguna/farmerlocalmobile.git",
  )
];
