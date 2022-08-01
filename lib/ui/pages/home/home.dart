import 'package:flutter/cupertino.dart';
import 'package:portfolio/ui/pages/home/components/banner.dart';
import 'package:portfolio/ui/pages/home/components/projects.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BannerWidget(),
        Projects(),
      ],
    );
  }
}
