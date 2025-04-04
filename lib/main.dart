import 'package:flutter/material.dart';
import 'package:psu_bus/components/navbar.dart';
import 'package:psu_bus/screens/user_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PSU-BUS',
      home: const NavBar(),
      routes: {
        '/profile': (context) => const UserProfilePage(),
        '/home-with-marker': (context) {
          final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
          return NavBar.withMarker(arguments: arguments);
        },
      },
    );
  }
}