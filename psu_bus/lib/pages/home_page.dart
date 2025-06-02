import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? mapController;
  LatLng _location = const LatLng(7.006249, 100.499634); // default: PSU

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    await Geolocator.requestPermission();
    Geolocator.getPositionStream().listen((pos) {
      setState(() => _location = LatLng(pos.latitude, pos.longitude));
      mapController?.animateCamera(CameraUpdate.newLatLng(_location));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _location, zoom: 16),
        onMapCreated: (c) => mapController = c,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
