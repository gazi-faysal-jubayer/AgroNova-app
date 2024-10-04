import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/background.jpeg'), // Update with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Child widget
        child,
      ],
    );
  }
}
