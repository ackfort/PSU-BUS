import 'package:psu_bus/models/density_card_model.dart';

final List<DensityInfo> mockMarkers = [
  DensityInfo(
    name: 'ป้ายรถเมล์ A',
    type: TransportType.stop,
    density: 'high density',
    waitingCount: 15,
    line: '1',
    lineColorType: 1,
    latitude: 13.736717,
    longitude: 100.523186,
  ),
  DensityInfo(
    name: 'ป้ายรถเมล์ B',
    type: TransportType.stop,
    density: 'medium density',
    waitingCount: 8,
    line: '2',
    lineColorType: 2,
    latitude: 13.745467,
    longitude: 100.530789,
  ),
  DensityInfo(
    name: 'รถบัส 101',
    type: TransportType.bus,
    density: 'low density',
    waitingCount: 5,
    line: '3',
    lineColorType: 3,
    latitude: 13.752896,
    longitude: 100.534112,
  ),
  DensityInfo(
    name: 'รถบัส 202',
    type: TransportType.bus,
    density: 'high density',
    waitingCount: 20,
    line: '1',
    lineColorType: 1,
    latitude: 13.760245,
    longitude: 100.540321,
  ),
];
