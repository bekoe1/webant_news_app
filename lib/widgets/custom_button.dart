import 'package:bloc_test_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrlButton extends StatelessWidget {
  const LaunchUrlButton({
    super.key,
    required this.height,
    required this.width,
    required this.url,
    required this.text,
  });

  final String text;
  final double height;
  final double width;
  final String url;

  Future<void> _launchInWebView(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _launchInWebView(url);
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.08),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.link,
              color: Color.fromRGBO(78, 75, 102, 1),
            ),
            const SizedBox(width: 17),
            Text(
              text,
              style: MyTextStyles.articleTitleStyle,
            )
          ],
        ),
      ),
    );
  }
}
