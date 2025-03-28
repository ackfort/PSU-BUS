import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:psu_bus/components/custom_searchbar.dart';
import 'package:psu_bus/mock_data/database.dart';
import '../models/density_card_model.dart';

class HomePage extends StatefulWidget {
  final DensityInfo? selectedMarker; // รับค่า marker ที่ต้องโฟกัส

  const HomePage({super.key, this.selectedMarker});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LatLng _center = const LatLng(7.007010366123527, 100.500721555236);
  GoogleMapController? _mapController; // เปลี่ยนจาก late เป็น nullable
  Set<Marker> _markers = {}; // เก็บ Markers

  @override
  void initState() {
    super.initState();
    _setMarkers();
  }

  void _setMarkers() {
    // สร้าง Marker จาก mockMarkers
    _markers =
        mockMarkers.map((marker) {
          return Marker(
            markerId: MarkerId(marker.name),
            position: LatLng(marker.latitude, marker.longitude),
            infoWindow: InfoWindow(title: marker.name),
          );
        }).toSet();
  }

  void _moveToSelectedMarker() {
    if (widget.selectedMarker != null && _mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(
            widget.selectedMarker!.latitude,
            widget.selectedMarker!.longitude,
          ),
          15.0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _moveToSelectedMarker(); // เรียกเมื่อหน้าโหลดเสร็จ
    });

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
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
                _moveToSelectedMarker(); // ย้ายกล้องถ้าเลือก Marker
              },
              markers: _markers,
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
