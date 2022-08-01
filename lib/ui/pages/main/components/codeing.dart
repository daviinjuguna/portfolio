import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';

import '../../../widgets/animated_progress.dart';

class Coding extends StatelessWidget {
  const Coding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Text(
            "Coding",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.8,
          label: "Dart",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.74,
          label: "Python",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.62,
          label: "Java",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.75,
          label: "PHP",
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.58,
          label: "JavaScript",
        ),
      ],
    );
  }
}
