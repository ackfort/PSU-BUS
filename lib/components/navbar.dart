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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          navigationBarTheme: NavigationBarThemeData(
            indicatorColor: Colors.indigoAccent, // สี indicator
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(
                  color: Colors.indigoAccent, // สีตัวอักษรเมื่อถูกเลือก
                  fontWeight: FontWeight.bold, // เน้นตัวหนา
                );
              }
              return const TextStyle(color: Colors.black); // สีปกติ
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
                color: Colors.white, // สีไอคอนเมื่อถูกเลือก
              ),
              icon: Icon(Icons.directions_bus),
              label: 'Bus Route',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: Colors.white, // สีไอคอนเมื่อถูกเลือก
              ),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.people,
                color: Colors.white, // สีไอคอนเมื่อถูกเลือก
              ),
              icon: Icon(Icons.people),
              label: 'Passenger Density',
            ),
          ],
        ),
      ),
      body:
          <Widget>[
            const BusRoutePage(),
            const HomePage(),
            const PassengerDensityPage(),
          ][currentPageIndex],
    );
  }
}
