import 'package:flutter/material.dart';

enum BusLineBus { line1, line2, line3 }

enum DensityLevelBus { low, medium, high }

class Bus {
  String name;
  BusLineBus line;
  double latitude;
  double longitude;
  DensityLevelBus density;
  int passenger;

  Bus({
    required this.name,
    required this.line,
    required this.latitude,
    required this.longitude,
    required this.density,
    required this.passenger,
  });

  // ฟังก์ชันสำหรับอัปเดตตำแหน่งแบบ real-time
  void updateLocation(double newLat, double newLng) {
    latitude = newLat;
    longitude = newLng;
  }

  // สีตามระดับความหนาแน่น
  Color get densityColor {
    switch (density) {
      case DensityLevelBus.low:
        return Colors.green;
      case DensityLevelBus.medium:
        return Colors.yellow;
      case DensityLevelBus.high:
        return Colors.red;
    }
  }

  // แปลง Enum เป็นข้อความ
  String get lineLabel {
    switch (line) {
      case BusLineBus.line1:
        return 'สาย 1';
      case BusLineBus.line2:
        return 'สาย 2';
      case BusLineBus.line3:
        return 'สาย 3';
    }
  }

  String get densityLabel {
    switch (density) {
      case DensityLevelBus.low:
        return 'หนาแน่นน้อย';
      case DensityLevelBus.medium:
        return 'ปานกลาง';
      case DensityLevelBus.high:
        return 'หนาแน่นมาก';
    }
  }
}
