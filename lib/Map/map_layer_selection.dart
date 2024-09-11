import 'package:flutter/material.dart';

class MapLayerSelection extends StatelessWidget {
  final String currentLayer;
  final ValueChanged<String> onLayerChanged;

  const MapLayerSelection({
    required this.currentLayer,
    required this.onLayerChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 10,
      child: GestureDetector(
        onTap: () => _showLayerSelection(context),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.layers,
            color: Colors.blue,
            size: 30.0,
          ),
        ),
      ),
    );
  }

  void _showLayerSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Map Layer'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildLayerOption(context, 'Street', Icons.map, Colors.blue),
                _buildLayerOption(context, 'Satellite', Icons.satellite, Colors.green),
                _buildLayerOption(context, 'Hybrid', Icons.layers, Colors.orange),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLayerOption(BuildContext context, String layer, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(layer),
      onTap: () {
        Navigator.of(context).pop();
        onLayerChanged(layer);
      },
    );
  }
}
