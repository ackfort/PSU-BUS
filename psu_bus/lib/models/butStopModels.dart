import 'package:flutter/material.dart';

enum BusLineStop { line1, line2, line3 }

enum DensityLevelStop { low, medium, high }

class BusStop {
  final String name;
  final BusLineStop line;
  final double latitude;
  final double longitude;
  final DensityLevelStop density;
  final int passenger;
  final Duration waitTime;

  BusStop({
    required this.name,
    required this.line,
    required this.latitude,
    required this.longitude,
    required this.density,
    required this.passenger,
    required this.waitTime,
  });

  // ฟังก์ชันสำหรับแสดงสีตามระดับความหนาแน่น
  Color get densityColor {
    switch (density) {
      case DensityLevelStop.low:
        return Colors.green;
      case DensityLevelStop.medium:
        return Colors.yellow;
      case DensityLevelStop.high:
        return Colors.red;
    }
  }

  // แปลง Enum เป็น String (เช่นสำหรับแสดงผล)
  String get lineLabel {
    switch (line) {
      case BusLineStop.line1:
        return 'สาย 1';
      case BusLineStop.line2:
        return 'สาย 2';
      case BusLineStop.line3:
        return 'สาย 3';
    }
  }

  String get densityLabel {
    switch (density) {
      case DensityLevelStop.low:
        return 'หนาแน่นน้อย';
      case DensityLevelStop.medium:
        return 'ปานกลาง';
      case DensityLevelStop.high:
        return 'หนาแน่นมาก';
    }
  }
}
