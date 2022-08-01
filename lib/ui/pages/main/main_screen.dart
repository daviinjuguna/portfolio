import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home/home.dart';
import 'package:portfolio/ui/pages/main/components/side_menu.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/responsive.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: kBgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    //*Open drawer
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
            ),
      drawer: Responsive.isDesktop(context) ? null : SideMenu(),
      body: Container(
        constraints: BoxConstraints(maxHeight: kMaxWidth),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: SideMenu(),
              ),
            if (Responsive.isDesktop(context)) SizedBox(width: kDefaultPadding),
            Expanded(
              flex: 7,
              child: Home(),
            )
          ],
        ),
      ),
    );
  }
}
