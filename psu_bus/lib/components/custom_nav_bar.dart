import 'package:flutter/material.dart';
import 'package:psu_bus/theme/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2), // เงาอยู่ด้านบนของ navbar
          ),
        ],
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: AppColors.deepBlue,
          backgroundColor: AppColors.white,
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((
            Set<MaterialState> states,
          ) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                color: AppColors.deepBlue,
                fontWeight: FontWeight.bold,
              );
            }
            return const TextStyle(color: Colors.grey);
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: onDestinationSelected,
          selectedIndex: currentIndex,
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(Icons.home, color: Colors.white),
              icon: Icon(Icons.home_outlined, color: Colors.grey),
              label: 'หน้าหลัก',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bus_alert, color: Colors.white),
              icon: Icon(Icons.bus_alert_outlined, color: Colors.grey),
              label: 'เส้นทางการเดินรถ',
            ),
          ],
        ),
      ),
    );
  }
}
