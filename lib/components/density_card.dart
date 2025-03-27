import 'package:flutter/material.dart';

class DensityCard extends StatelessWidget {
  final String busStopName;
  final String density;
  final int passengerCount;

  const DensityCard({
    Key? key,
    required this.busStopName,
    required this.density,
    required this.passengerCount,
  }) : super(key: key);

  Color _getDensityColor() {
    switch (density.toLowerCase()) {
      case 'high density':
        return Colors.red.shade400;
      case 'medium density':
        return Colors.orange.shade400;
      case 'low density':
        return Colors.green.shade400;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bus stop name (large and bold)
            Text(
              busStopName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Density indicator (colored)
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getDensityColor(),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(density, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),

            // Passenger count
            Text(
              '$passengerCount passengers',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
