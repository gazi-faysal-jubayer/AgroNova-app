import 'package:flutter/material.dart';

class MapLayerSelection extends StatelessWidget {
  final String currentLayer;
  final ValueChanged<String> onLayerChanged;

  const MapLayerSelection({
    required this.currentLayer,
    required this.onLayerChanged,
    Key? key,
  }) : super(key: key);

  void _showLayerSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.layers, color: Colors.blue),
                    SizedBox(width: 8),
                    Text(
                      'Select Map Layer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        onLayerChanged(layer);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            SizedBox(width: 16),
            Text(
              layer,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
}
