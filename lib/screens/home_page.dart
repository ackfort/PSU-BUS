import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LatLng _center = const LatLng(7.007010366123527, 100.500721555236);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PSU-BUS')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      ),
    );
  }
}