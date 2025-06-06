import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:psu_bus/components/custom_searchbar.dart';
import 'package:psu_bus/mockData/mock_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? mapController;
  LatLng _location = const LatLng(7.006249, 100.499634);

  final Set<Marker> _markers =
      busStopDatabase
          .map(
            (busStop) => Marker(
              markerId: MarkerId(busStop.name),
              position: LatLng(busStop.latitude, busStop.longitude),
              infoWindow: InfoWindow(
                title: busStop.name,
                snippet:
                    '${busStop.lineLabel} - ${busStop.densityLabel}\nผู้โดยสาร: ${busStop.passenger}\nรอ: ${busStop.waitTime.inMinutes} นาที',
              ),
              icon: BitmapDescriptor.defaultMarker,
            ),
          )
          .toSet();

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  void _initLocation() async {
    await Geolocator.requestPermission();
    Geolocator.getPositionStream().listen((pos) {
      final newLocation = LatLng(pos.latitude, pos.longitude);
      if (mounted) {
        setState(() => _location = newLocation);
        mapController?.animateCamera(CameraUpdate.newLatLng(newLocation));
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(target: _location, zoom: 16),
          onMapCreated: (ctrl) => mapController = ctrl,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: _markers,
        ),
        Positioned(
          top: 40,
          left: 15,
          right: 15,
          child: BusSearchBar(
            onSelected: (LatLng position) {
              mapController?.animateCamera(
                CameraUpdate.newLatLngZoom(position, 17),
              );
            },
          ),
        ),
      ],
    ),
  );
}
