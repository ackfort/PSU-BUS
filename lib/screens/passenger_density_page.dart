import 'package:flutter/material.dart';
import 'package:psu_bus/components/custom_appbar.dart';
import 'package:psu_bus/components/line_filter.dart';
import 'package:psu_bus/mock_data/database.dart';
import '../models/density_card_model.dart';
import '../components/density_card.dart';

class PassengerDensityPage extends StatefulWidget {
  @override
  _PassengerDensityPageState createState() => _PassengerDensityPageState();
}

class _PassengerDensityPageState extends State<PassengerDensityPage> {
  final List<DensityInfo> allBusStops = mockMarkers;
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

  void _navigateToHome(DensityInfo info) {
    Navigator.pushNamed(context, '/home-with-marker', arguments: info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(height: 6),
          LineFilter(
            availableLines: availableLines,
            selectedLine: selectedLine,
            onChanged: (String? newValue) {
              setState(() {
                selectedLine = newValue == "ทั้งหมด" ? null : newValue;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 6),
              itemCount: filteredBusStops.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap:
                      () => _navigateToHome(
                        filteredBusStops[index],
                      ), // กดแล้วไป HomePage
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: DensityCard(info: filteredBusStops[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
