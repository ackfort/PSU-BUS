// components/navbar.dart
import 'package:flutter/material.dart';
import 'package:psu_bus/screens/bus_route_page.dart';
import 'package:psu_bus/screens/home_page.dart';
import 'package:psu_bus/screens/passenger_density_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_bus),
            label: 'Bus Route',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Passenger Density',
          ),
        ],
      ),
      body: <Widget>[
        HomePage(),
        BusRoutePage(),
        PassengerDensityPage(),
      ][currentPageIndex],
    );
  }
}