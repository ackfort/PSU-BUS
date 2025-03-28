import 'package:flutter/material.dart';
import '../models/density_card_model.dart';

class DensityCard extends StatelessWidget {
  final DensityInfo info;

  const DensityCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name and type
            Row(
              children: [
                Text(
                  info.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Line information
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: DensityInfo.getLineColor(info.lineColorType).withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: DensityInfo.getLineColor(info.lineColorType),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    info.type == TransportType.bus 
                        ? Icons.directions_bus 
                        : Icons.pin_drop,
                    size: 18,
                    color: DensityInfo.getLineColor(info.lineColorType),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'สาย ${info.line}',
                    style: TextStyle(
                      fontSize: 16,
                      color: DensityInfo.getLineColor(info.lineColorType),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Density and waiting information
            Row(
              children: [
                // Density indicator
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: DensityInfo.getDensityColor(info.density).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: DensityInfo.getDensityColor(info.density),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        info.density,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Waiting count
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.people,
                        size: 16,
                        color: Colors.indigo,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${info.waitingCount} รออยู่',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
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