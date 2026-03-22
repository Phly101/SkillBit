import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchExternalUrl {
  static Future<void> launchExternalUrl(final Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      //Todo: handle the error later
      debugPrint('Could not launch $uri');
    }
  }
}
