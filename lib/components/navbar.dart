import 'package:flutter/material.dart';
import 'package:psu_bus/screens/bus_route_page.dart';
import 'package:psu_bus/screens/home_page.dart';
import 'package:psu_bus/screens/passenger_density_page.dart';
import '../models/density_card_model.dart';

class NavBar extends StatefulWidget {
  final DensityInfo? selectedMarker;
  final int? initialPageIndex;

  const NavBar({super.key, this.selectedMarker, this.initialPageIndex});

  // Named constructor สำหรับกรณีที่มี marker
  const NavBar.withMarker({super.key, required this.selectedMarker}) 
      : initialPageIndex = 1; // 1 คือ index ของ HomePage

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
    
    // สร้างหน้า HomePage ด้วย selectedMarker ถ้ามี
    pages = [
      BusRoutePage(),
      HomePage(selectedMarker: widget.selectedMarker),
      PassengerDensityPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          navigationBarTheme: NavigationBarThemeData(
            indicatorColor: Colors.indigoAccent,
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(
                  color: Colors.indigoAccent,
                  fontWeight: FontWeight.bold,
                );
              }
              return const TextStyle(color: Colors.black);
            }),
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.directions_bus,
                color: Colors.white,
              ),
              icon: Icon(Icons.directions_bus),
              label: 'Bus Route',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.people,
                color: Colors.white,
              ),
              icon: Icon(Icons.people),
              label: 'Passenger Density',
            ),
          ],
        ),
      ),
      body: pages[currentPageIndex],
    );
  }
}