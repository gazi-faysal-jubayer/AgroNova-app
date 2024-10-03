import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String? title;
  final String? description;
  final IconData? icon;
  final String? imagePath;
  final Function()? onTap;
  final List<Color>? gradientColors;
  final String? logoPath;

  const HomeCard({
    super.key,
    this.title, // Optional parameter
    this.description, // Optional parameter
    this.icon, // Optional parameter
    this.imagePath, // Optional parameter
    this.onTap, // Optional parameter
    this.gradientColors, // Optional parameter
    this.logoPath, // Optional parameter
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Card with background and content
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: onTap, // Use null-aware operator for optional callback
            child: Container(
              width: 300,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: imagePath != null
                    ? DecorationImage(
                        image: AssetImage(imagePath!),
                        fit: BoxFit.cover,
                      )
                    : null, // Only set image if provided
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: gradientColors != null
                      ? LinearGradient(
                          colors: gradientColors!,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null, // Apply gradient if provided
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) // Only show icon if provided
                      Icon(
                        icon,
                        size: 50,
                        color: Colors.white,
                      ),
                    if (icon != null) const SizedBox(height: 10),
                    if (title != null) // Only show title if provided
                      Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    if (title != null) const SizedBox(height: 5),
                    if (description !=
                        null) // Only show description if provided
                      Text(
                        description!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Round logo positioned on top of the card
        if (logoPath != null)
          Positioned(
            top: -40,
            left: 120,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(color: Colors.white, width: 3),
                image: DecorationImage(
                  image: AssetImage(logoPath!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
