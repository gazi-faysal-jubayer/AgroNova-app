import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CropCard extends StatelessWidget {
  final String? title; // Optional
  final String? description; // Optional
  final IconData? icon; // Optional
  final String? imagePath; // Optional
  final String? svgIconPath; // Optional (for SVG icon)
  final Function()? onTap; // Optional
  final List<Color>? gradientColors; // Optional

  const CropCard({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.imagePath,
    this.svgIconPath, // Added for SVG support
    this.onTap,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 300,
          height: 185,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: imagePath != null
                ? DecorationImage(
              image: AssetImage(imagePath!),
              fit: BoxFit.cover,
            )
                : null, // No image if imagePath is null
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
                  : null, // No gradient if gradientColors is null
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              // Center the content
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null)
                    Icon(
                      icon,
                      size: 50,
                      color: Colors.white,
                    ),
                  if (svgIconPath != null) // Show SVG if svgIconPath is not null
                    SvgPicture.asset(
                      svgIconPath!,
                      height: 50, // Set height to ensure visibility
                      width: 50,  // Set width to ensure visibility
                      colorFilter: const ColorFilter.mode(
                        Colors.white,  // Replace with your desired color
                        BlendMode.srcIn, // Defines how the color is applied
                      ),
                      placeholderBuilder: (context) => CircularProgressIndicator(), // Optional: show a placeholder while loading
                    ),

                  if (icon != null || svgIconPath != null)
                    const SizedBox(height: 10),
                  if (title != null)
                    Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  if (title != null) const SizedBox(height: 5),
                  if (description != null)
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
    );
  }
}
