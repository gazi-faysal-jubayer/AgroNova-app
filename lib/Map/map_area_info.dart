import 'package:flutter/material.dart';

class MapAreaInfo extends StatelessWidget {
  final double area;
  final double perimeter;

  const MapAreaInfo({
    required this.area,
    required this.perimeter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.area_chart,
                  color: Colors.blue,
                  size: 24.0,
                ),
                const SizedBox(width: 8),
                Text(
                  'Area: ${area.toStringAsFixed(2)} sq meters',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.linear_scale,
                  color: Colors.green,
                  size: 24.0,
                ),
                const SizedBox(width: 8),
                Text(
                  'Perimeter: ${perimeter.toStringAsFixed(2)} meters',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
