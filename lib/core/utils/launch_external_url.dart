import 'package:url_launcher/url_launcher.dart';

class LaunchExternalUrl {
  static Future<void> launchExternalUrl(final Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }
}
