import 'package:flutter/material.dart';
import 'package:psu_bus/components/navbar.dart';
import 'package:psu_bus/screens/user_profile_page.dart';
import '../models/density_card_model.dart';

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
          final info = ModalRoute.of(context)!.settings.arguments as DensityInfo?;
          return NavBar.withMarker(selectedMarker: info);
        },
      },
    );
  }
}