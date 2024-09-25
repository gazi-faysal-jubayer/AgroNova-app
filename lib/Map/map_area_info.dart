import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapAreaInfo extends StatelessWidget {
  final double area;
  final double perimeter;
  final Map<String, dynamic> soilData;

  const MapAreaInfo({
    required this.area,
    required this.perimeter,
    required this.soilData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(soilData);
    final ph = soilData['properties']['layers'][0]['depths'][0]['values']['mean'] ?? 'N/A';
    final organicCarbon = soilData['organic_carbon'] ?? 'N/A';
    final otherProperties = soilData['other_properties'] ?? 'N/A';

    return SlidingUpPanel(
      minHeight: 100, // Height when collapsed
      maxHeight: 400, // Height when fully expanded
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Swipe up for more info',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Soil Information:',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.ac_unit),
            title: Text('pH: $ph'),
          ),
          ListTile(
            leading: const Icon(Icons.cloud),
            title: Text('Organic Carbon: $organicCarbon'),
          ),
          ListTile(
            leading: const Icon(Icons.bubble_chart),
            title: Text('Other properties: $otherProperties'),
          ),
        ],
      ),
      collapsed: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Center(
          child: Text(
            'Area: ${area.toStringAsFixed(2)} sq meters\nPerimeter: ${perimeter.toStringAsFixed(2)} meters',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
    );
  }
}
