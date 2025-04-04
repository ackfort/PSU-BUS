import 'package:flutter/material.dart';
import 'package:psu_bus/screens/bus_route_page.dart';
import 'package:psu_bus/screens/home_page.dart';
import 'package:psu_bus/screens/passenger_density_page.dart';
import '../models/density_card_model.dart';

class NavBar extends StatefulWidget {
  final DensityInfo? selectedMarker;
  final List<DensityInfo>? busesInSameLine;
  final int? initialPageIndex;

  const NavBar({
    super.key,
    this.selectedMarker,
    this.busesInSameLine,
    this.initialPageIndex,
  });

  factory NavBar.withMarker({Key? key, required Object? arguments}) {
    final args = arguments as Map<String, dynamic>?;
    return NavBar(
      key: key,
      selectedMarker: args?['selectedMarker'] as DensityInfo?,
      busesInSameLine: args?['busesInSameLine'] as List<DensityInfo>?,
      initialPageIndex: 1,
    );
  }

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int currentPageIndex;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.initialPageIndex ?? 0;
    pages = [
      BusRoutePage(),
      HomePage(selectedMarker: widget.selectedMarker),
      PassengerDensityPage(),
    ];
  }

  Widget _buildBusChip(DensityInfo bus) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border.all(
          color: DensityInfo.getLineColor(bus.lineColorType),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.directions_bus,
            size: 16,
            color: DensityInfo.getLineColor(bus.lineColorType),
          ),
          const SizedBox(width: 6),
          Text(bus.name, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 6),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: DensityInfo.getDensityColor(bus.density),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Main content area
          Expanded(child: pages[currentPageIndex]),

          // Bottom bus information section (only shows when marker is selected)
          if (widget.selectedMarker != null)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
              ),
              child:
                  widget.busesInSameLine?.isNotEmpty ?? false
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                              children: [
                                const TextSpan(text: 'สถานที่ปลายทาง: '),
                                TextSpan(
                                  text: widget.selectedMarker?.name ?? '',
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' | เดินทางด้วยรถบัสในสาย: ',
                                ),
                                TextSpan(
                                  text: widget.selectedMarker?.line ?? '',
                                  style: TextStyle(
                                    color: DensityInfo.getLineColor(
                                      widget.selectedMarker?.lineColorType ?? 0,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'มีรถให้บริการ ณ ขณะนี้ ${widget.busesInSameLine!.length} คัน',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 40,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...widget.busesInSameLine!
                                    .map(_buildBusChip)
                                    .toList(),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ],
                      )
                      : Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                ),
                                children: [
                                  const TextSpan(text: 'สถานที่ปลายทาง: '),
                                  TextSpan(
                                    text: widget.selectedMarker?.name ?? '',
                                    style: TextStyle(
                                      color: Colors.blue[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'เดินทางด้วยรถบัสในสาย: ',
                                  ),
                                  TextSpan(
                                    text: widget.selectedMarker?.line ?? '',
                                    style: TextStyle(
                                      color: DensityInfo.getLineColor(
                                        widget.selectedMarker?.lineColorType ??
                                            0,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'ไม่มีรถให้บริการอยู่ ณ ขณะนี้',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
            ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.directions_bus_outlined),
            selectedIcon: Icon(Icons.directions_bus),
            label: 'เส้นทาง',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'ความหนาแน่น',
          ),
        ],
      ),
    );
  }
}
