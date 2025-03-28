import 'package:flutter/material.dart';
import 'package:psu_bus/components/custom_appbar.dart';
import 'package:psu_bus/components/line_filter.dart';
import '../models/density_card_model.dart';
import '../components/density_card.dart';

class PassengerDensityPage extends StatefulWidget {
  @override
  _PassengerDensityPageState createState() => _PassengerDensityPageState();
}

class _PassengerDensityPageState extends State<PassengerDensityPage> {
  final List<DensityInfo> allBusStops = [
    DensityInfo(
      name: "รถบัสหมายเลข 15A",
      type: TransportType.bus,
      density: "High Density",
      waitingCount: 35,
      line: "1",
      lineColorType: 1, // blue
    ),
    DensityInfo(
      name: "ป้ายสยามสแควร์",
      type: TransportType.stop,
      density: "Medium Density",
      waitingCount: 22,
      line: "2",
      lineColorType: 2, // red
    ),
    DensityInfo(
      name: "รถบัสหมายเลข 8",
      type: TransportType.bus,
      density: "Low Density",
      waitingCount: 8,
      line: "1",
      lineColorType: 1, // blue
    ),
    DensityInfo(
      name: "ป้ายมหาวิทยาลัย",
      type: TransportType.stop,
      density: "High Density",
      waitingCount: 42,
      line: "3",
      lineColorType: 3, // green
    ),
  ];

  String? selectedLine;
  List<String> availableLines = [];

  @override
  void initState() {
    super.initState();
    availableLines = allBusStops.map((stop) => stop.line).toSet().toList();
    availableLines.insert(0, "ทั้งหมด");
  }

  List<DensityInfo> get filteredBusStops {
    if (selectedLine == null || selectedLine == "ทั้งหมด") {
      return allBusStops;
    }
    return allBusStops.where((stop) => stop.line == selectedLine).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          // Using the new filter component
          SizedBox(height: 6,),
          LineFilter(
            availableLines: availableLines,
            selectedLine: selectedLine,
            onChanged: (String? newValue) {
              setState(() {
                selectedLine = newValue == "ทั้งหมด" ? null : newValue;
              });
            },
          ),
          // List of cards
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 6),
              itemCount: filteredBusStops.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: DensityCard(info: filteredBusStops[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
