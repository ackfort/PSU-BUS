import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:psu_bus/components/custom_searchbar.dart';

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
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          /// 🗺 Google Map เป็นพื้นหลัง
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),

          /// 🔍 Search Bar วางด้านหน้า
          Positioned(
            top: 10,
            left: 16,
            right: 16,
            child: const CustomSearchBar(),
          ),
        ],
      ),
    );
  }
}
