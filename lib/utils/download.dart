import 'dart:convert';
import 'dart:developer';
import 'dart:html' as html;

import 'package:flutter/services.dart';

class Download {
  static void downloadFile(String asset) async {
    try {
      final _fileStr = await rootBundle.load("assets/doc/cv.pdf");
      // final _file = File(_fileStr);
      final _rawData = _fileStr.buffer
          .asUint8List(_fileStr.offsetInBytes, _fileStr.lengthInBytes);
      final _content = base64Encode(_rawData);
      html.AnchorElement _anchorElement = new html.AnchorElement(
        href: "data:application/octet-stream;charset=utf-16le;base64,$_content",
      );
      _anchorElement.setAttribute("download", "cv.pdf");
      _anchorElement.click();
    } catch (e, s) {
      print(e.toString());
      print(s.toString());
      log("Download error", error: e, stackTrace: s);
      print("FAILED");
    }
  }
}

// Uri _assetsUri(String asset) => Uri.parse("asset:///$asset");
