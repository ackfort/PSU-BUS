import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:psu_bus/components/custom_searchbar.dart';
import 'package:psu_bus/components/bus_stop_popup.dart';
import 'package:psu_bus/mock_data/database.dart';
import '../models/density_card_model.dart';

class HomePage extends StatefulWidget {
  final DensityInfo? selectedMarker;

  const HomePage({super.key, this.selectedMarker});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LatLng _center = const LatLng(7.007010366123527, 100.500721555236);
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  DensityInfo? _selectedMarker;
  OverlayEntry? _popupOverlay;

  @override
  void initState() {
    super.initState();
    _setMarkers();
    _selectedMarker = widget.selectedMarker;
  }

  void _setMarkers() {
    _markers = mockMarkers.map((marker) {
      return Marker(
        markerId: MarkerId(marker.name),
        position: LatLng(marker.latitude, marker.longitude),
        onTap: () => _showPopup(marker),
      );
    }).toSet();
  }

  void _showPopup(DensityInfo marker) {
  _removePopup();
  
  _selectedMarker = marker;
  
  final overlayState = Overlay.of(context);
  
  _popupOverlay = OverlayEntry(
    builder: (context) => GestureDetector(
      onTap: _removePopup,
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.black.withOpacity(0.3),
        child: BusStopPopup(
          marker: marker,
          onClose: _removePopup,
        ),
      ),
    ),
  );
  
  overlayState.insert(_popupOverlay!);
}

  void _removePopup() {
    if (_popupOverlay != null) {
      _popupOverlay!.remove();
      _popupOverlay = null;
    }
  }

  void _moveToSelectedMarker() {
    if (_selectedMarker != null && _mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(
            _selectedMarker!.latitude,
            _selectedMarker!.longitude,
          ),
          15.0,
        ),
      );
      
      if (_selectedMarker == widget.selectedMarker) {
        _showPopup(_selectedMarker!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _moveToSelectedMarker();
    });

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
                _moveToSelectedMarker();
              },
              markers: _markers,
              onTap: (_) => _removePopup(),
            ),
          ),

          Positioned(
            top: 10,
            left: 16,
            right: 16,
            child: CustomSearchBar(
              onMarkerSelected: (marker) {
                _selectedMarker = marker;
                _mapController?.animateCamera(
                  CameraUpdate.newLatLngZoom(
                    LatLng(marker.latitude, marker.longitude),
                    15.0,
                  ),
                );
                _showPopup(marker);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _removePopup();
    super.dispose();
  }
}