import 'package:flutter/material.dart';

enum BusLine { line1, line2, line3 }

enum DensityLevel { low, medium, high }

class BusStop {
  final String name;
  final BusLine line;
  final double latitude;
  final double longitude;
  final DensityLevel density;
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
      case DensityLevel.low:
        return Colors.green;
      case DensityLevel.medium:
        return Colors.yellow;
      case DensityLevel.high:
        return Colors.red;
    }
  }

  // แปลง Enum เป็น String (เช่นสำหรับแสดงผล)
  String get lineLabel {
    switch (line) {
      case BusLine.line1:
        return 'สาย 1';
      case BusLine.line2:
        return 'สาย 2';
      case BusLine.line3:
        return 'สาย 3';
    }
  }

  String get densityLabel {
    switch (density) {
      case DensityLevel.low:
        return 'หนาแน่นน้อย';
      case DensityLevel.medium:
        return 'ปานกลาง';
      case DensityLevel.high:
        return 'หนาแน่นมาก';
    }
  }
}