import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MissionLink extends StatelessWidget {
  final String linkText;
  final String url;

  const MissionLink({
    Key? key,
    required this.linkText,
    required this.url,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Column(
        children: [
          Center( // Center the title
            child: const Text(
              'Visit NASA:', // Constant title
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
          ),
          Center( // Center the link text
            child: GestureDetector(
              onTap: _launchUrl,
              child: Text(
                linkText,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
