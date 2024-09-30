import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../Model/soilgrid_data_model.dart';

class MapAreaInfo extends StatelessWidget {
  final double area;
  final double perimeter;
  final Soilgrid? soilData;
  final bool isLoading;

  const MapAreaInfo({
    required this.area,
    required this.perimeter,
    required this.soilData,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 100,
      maxHeight: 400,
      panel: isLoading
          ? Center(child: CircularProgressIndicator())
          : _buildSoilInfoPanel(),
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

  Widget _buildSoilInfoPanel() {
    if (soilData == null) {
      return Center(child: Text('No soil data available'));
    }

    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Soil Information:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        ...soilData!.properties.layers.map((layer) => _buildLayerInfo(layer)).toList(),
      ],
    );
  }

  Widget _buildLayerInfo(Layer layer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${layer.name} (${layer.code}):',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ...layer.depths.map((depth) => _buildDepthInfo(depth, layer.unitMeasure)).toList(),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDepthInfo(Depth depth, UnitMeasure unitMeasure) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Depth: ${depth.range.topDepth}-${depth.range.bottomDepth} ${depth.range.unitDepth}'),
        ...depth.values.entries.map((entry) {
          return Text('${entry.key}: ${entry.value} ${unitMeasure.targetUnits}');
        }).toList(),
        SizedBox(height: 8),
      ],
    );
  }
}