import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/constants.dart';

import 'ui/pages/main/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //*google poppins
  GoogleFonts.config.allowRuntimeFetching = false;
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        canvasColor: kBgColor,
        colorScheme: ColorScheme.dark().copyWith(
          primary: kPrimaryColor,
          background: kBgColor,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context)
              .textTheme
              .apply(bodyColor: kDefaultTextColor)
              .copyWith(
                bodyText1: TextStyle(color: kBodyTextColor),
                bodyText2: TextStyle(color: kBodyTextColor),
              ),
        ),
      ),
      home: MainPage(),
    );
  }
}
