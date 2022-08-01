import 'dart:developer';

import 'package:url_launcher/url_launcher_string.dart';

class LaunchUrl {
  static void launch(String url) async {
    if (await canLaunchUrlString(url)) {
      launchUrlString(url, webViewConfiguration: WebViewConfiguration())
          .then((value) {
        if (value) {
          log("Launched Url");
        } else {
          //!Handle error
        }
      });

      return;
    }

    //!Handle error
  }
}
