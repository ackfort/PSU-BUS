// components/bus_stop_popup.dart
import 'package:flutter/material.dart';
import '../models/density_card_model.dart';

class BusStopPopup extends StatelessWidget {
  final DensityInfo marker;
  final VoidCallback onClose;

  const BusStopPopup({
    super.key, 
    required this.marker,
    required this.onClose,
  });

  String _getDensityText(String density) {
    switch (density.toLowerCase()) {
      case 'high density':
        return 'หนาแน่นมาก';
      case 'medium density':
        return 'ปานกลาง';
      case 'low density':
        return 'น้อย';
      default:
        return density;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10), // เว้นที่สำหรับปุ่มปิด
                      Text(
                        marker.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Text('สายรถบัส: ', style: TextStyle(fontSize: 16)),
                          Text(
                            marker.line,
                            style: TextStyle(
                              fontSize: 16,
                              color: DensityInfo.getLineColor(marker.lineColorType),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text('ความหนาแน่น: ', style: TextStyle(fontSize: 16)),
                          Container(
                            width: 14,
                            height: 14,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: DensityInfo.getDensityColor(marker.density),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            _getDensityText(marker.density),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'จำนวนคนที่รอ: ${marker.waitingCount} คน',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -15,
                right: -15,
                child: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  onPressed: onClose,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}