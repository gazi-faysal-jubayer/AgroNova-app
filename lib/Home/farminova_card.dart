import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FarminovaCard extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final String figmaLink;

  const FarminovaCard({
    super.key,
    required this.imagePath,
    required this.buttonText,
    required this.figmaLink,
  });

  // Function to launch the Figma URL
  Future<void> _launchURL() async {
    final Uri url = Uri.parse(figmaLink);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $figmaLink');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          // Background Image
          Container(
            width: 300,
            height: 670,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Button Positioned at the Bottom Center
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(32, 160, 144, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: _launchURL,
                // Call the function to open the Figma link
                child: Text(buttonText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
