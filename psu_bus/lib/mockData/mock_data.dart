import 'package:psu_bus/models/busModel.dart';
import 'package:psu_bus/models/butStopModels.dart';

// Bus Database (6 คัน)
final List<Bus> busDatabase = [
  Bus(
    name: 'Bus A1',
    line: BusLineBus.line1,
    latitude: 13.7563,
    longitude: 100.5018,
    density: DensityLevelBus.low,
    passenger: 10,
  ),
  Bus(
    name: 'Bus A2',
    line: BusLineBus.line1,
    latitude: 13.7581,
    longitude: 100.5020,
    density: DensityLevelBus.medium,
    passenger: 25,
  ),
  Bus(
    name: 'Bus B1',
    line: BusLineBus.line2,
    latitude: 13.7620,
    longitude: 100.5100,
    density: DensityLevelBus.high,
    passenger: 40,
  ),
  Bus(
    name: 'Bus B2',
    line: BusLineBus.line2,
    latitude: 13.7630,
    longitude: 100.5130,
    density: DensityLevelBus.medium,
    passenger: 22,
  ),
  Bus(
    name: 'Bus C1',
    line: BusLineBus.line3,
    latitude: 13.7700,
    longitude: 100.5200,
    density: DensityLevelBus.low,
    passenger: 12,
  ),
  Bus(
    name: 'Bus C2',
    line: BusLineBus.line3,
    latitude: 13.7725,
    longitude: 100.5225,
    density: DensityLevelBus.high,
    passenger: 45,
  ),
];

// BusStop Database (2 จุด)
final List<BusStop> busStopDatabase = [
  BusStop(
    name: 'Bus Stop A',
    line: BusLineStop.line1,
    latitude: 13.7560,
    longitude: 100.5000,
    density: DensityLevelStop.medium,
    passenger: 15,
    waitTime: Duration(minutes: 3),
  ),
  BusStop(
    name: 'Bus Stop B',
    line: BusLineStop.line3,
    latitude: 13.7710,
    longitude: 100.5210,
    density: DensityLevelStop.high,
    passenger: 30,
    waitTime: Duration(minutes: 1),
  ),
];