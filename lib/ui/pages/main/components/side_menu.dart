import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/ui/pages/main/components/codeing.dart';
import 'package:portfolio/ui/pages/main/components/skills.dart';

import 'package:portfolio/utils/age.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/download.dart';
import 'package:portfolio/utils/launch_url.dart';

import 'area_info_text.dart';
import 'knowledge.dart';
import 'my_profile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SafeArea(
          child: Column(
            children: [
              MyProfile(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(kDefaultPadding),
                  children: [
                    AreaInfoText(
                      title: "Residence",
                      text: "Kenya",
                    ),
                    AreaInfoText(
                      title: "City",
                      text: "Nairobi",
                    ),
                    AreaInfoText(
                      title: "Age",
                      text: "${_age()}",
                    ),
                    Skills(),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Coding(),
                    Knowledges(),
                    Divider(),
                    SizedBox(height: kDefaultPadding / 2),
                    TextButton(
                      onPressed: () {
                        Download.downloadFile(CV);
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "DOWNLOAD CV",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                            SizedBox(width: kDefaultPadding / 2),
                            Icon(Icons.picture_as_pdf)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      color: Color(0xFF24242E),
                      child: Row(
                        children: [
                          Spacer(),
                          _textButton(
                            context,
                            () => LaunchUrl.launch(LINKEDIN),
                            "assets/icons/linkedin.svg",
                            svgColor: Color(0xff0e76a8),
                          ),
                          _textButton(
                            context,
                            () => LaunchUrl.launch(GITHUB),
                            "assets/icons/github.svg",
                            svgColor: Colors.white,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

TextButton _textButton(BuildContext ctx, VoidCallback press, String svgPath,
        {Color? svgColor}) =>
    TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered))
              return Theme.of(ctx).colorScheme.primary.withOpacity(0.1);
            return null;
          },
        ),
      ),
      onPressed: press,
      child: SvgPicture.asset(
        svgPath,
        color: svgColor,
      ),
    );

String _age() {
  final _age = Age.dateDifference(
    fromDate: DateTime(1997, 6, 8),
    toDate: DateTime.now(),
    includeToDate: true,
  );
  return _age.years.toString();
}
