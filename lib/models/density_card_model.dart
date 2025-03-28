import 'package:flutter/material.dart';

class DensityInfo {
  final String name; // ชื่อป้ายหรือรถบัส
  final TransportType type; // ชนิด (รถบัสหรือป้าย)
  final String density; // ความหนาแน่น
  final int waitingCount; // จำนวนผู้ใช้บริการที่รออยู่
  final String line; // สายของป้ายหรือรถบัส
  final int lineColorType; // 1: blue, 2: red, 3: green
  final double latitude; // ละติจูดของตำแหน่ง
  final double longitude; // ลองจิจูดของตำแหน่ง

  const DensityInfo({
    required this.name,
    required this.type,
    required this.density,
    required this.waitingCount,
    required this.line,
    required this.lineColorType,
    required this.latitude,
    required this.longitude,
  });

  // Helper methods
  static Color getDensityColor(String density) {
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

  static Color getLineColor(int lineColorType) {
    switch (lineColorType) {
      case 1:
        return Colors.blue;
      case 2:
        return Colors.red;
      case 3:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String get typeName => type == TransportType.bus ? 'รถบัส' : 'ป้าย';
}

enum TransportType { bus, stop }
