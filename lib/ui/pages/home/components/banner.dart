import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/responsive.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: Responsive.isMobile(context) ? 2.5 : 3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/bg.jpg",
              fit: BoxFit.cover,
            ),
            Container(color: kDarkColor.withOpacity(0.66)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Discover my Amazing \nArt Space!",
                    style: Responsive.isDesktop(context)
                        ? Theme.of(context).textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )
                        : Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                  ),
                  if (Responsive.isTablet(context))
                    const SizedBox(height: kDefaultPadding / 2),
                  _MyBuildAnimatedText(),
                  SizedBox(height: kDefaultPadding),
                ],
              ),
            )
          ],
        ),
      );
}

class _MyBuildAnimatedText extends StatelessWidget {
  const _MyBuildAnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      // it applies same style to all the widgets under it
      style: Theme.of(context).textTheme.subtitle1!,
      maxLines: 1,
      child: Row(
        children: [
          if (!Responsive.isTablet(context)) _FlutterCodedText(),
          if (!Responsive.isTablet(context))
            SizedBox(width: kDefaultPadding / 2),
          Text("I build "),
          Responsive.isMobile(context)
              ? Expanded(child: _AnimatedText())
              : _AnimatedText(),
          if (!Responsive.isTablet(context))
            SizedBox(width: kDefaultPadding / 2),
          if (!Responsive.isTablet(context)) _FlutterCodedText(),
        ],
      ),
    );
  }
}

class _AnimatedText extends StatelessWidget {
  const _AnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TyperAnimatedText(
          "Multiplatform Android and IOs Application.",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "Backend APIs",
          speed: Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "Complete Ecommerce app",
          speed: Duration(milliseconds: 60),
        ),
      ],
    );
  }
}

class _FlutterCodedText extends StatelessWidget {
  const _FlutterCodedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(
            text: "flutter",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          TextSpan(text: ">"),
        ],
      ),
    );
  }
}
