import 'package:flutter/material.dart';
import 'package:psu_bus/mock_data/database.dart';
import 'package:psu_bus/models/density_card_model.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(DensityInfo)? onMarkerSelected;
  
  const CustomSearchBar({super.key, this.onMarkerSelected});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  List<DensityInfo> _searchResults = [];
  bool _showResults = false;

  void _searchMarkers(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _showResults = false;
      });
      return;
    }

    // ค้นหาเฉพาะป้ายรถเมล์ (TransportType.stop)
    final busStops = mockMarkers.where((marker) => 
      marker.type == TransportType.stop
    ).toList();

    final results = busStops.where((marker) {
      return marker.name.toLowerCase().contains(query.toLowerCase()) ||
          marker.line.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _searchResults = results;
      _showResults = true;
    });
  }

  void _navigateToMarker(DensityInfo marker) {
    // หารถบัสทั้งหมดที่อยู่ในสายเดียวกัน
    final busesInSameLine = mockMarkers.where((m) => 
      m.type == TransportType.bus && 
      m.line == marker.line
    ).toList();

    // ส่งข้อมูลไปยังหน้า Home
    if (widget.onMarkerSelected != null) {
      widget.onMarkerSelected!(marker);
    }

    // นำทางไปยังหน้า home-with-marker พร้อมข้อมูล
    Navigator.of(context).pushNamed(
      '/home-with-marker',
      arguments: {
        'selectedMarker': marker,
        'busesInSameLine': busesInSameLine,
      },
    );

    setState(() {
      _showResults = false;
      _searchController.clear();
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'PSU-BUS',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "ค้นหาป้ายรถเมล์...",
                      hintStyle: TextStyle(color: Colors.black45),
                      border: InputBorder.none,
                    ),
                    onChanged: _searchMarkers,
                    onTap: () {
                      setState(() {
                        _showResults = true;
                      });
                    },
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black54, size: 30),
                onPressed: () {
                  if (_searchResults.isNotEmpty) {
                    _navigateToMarker(_searchResults.first);
                  }
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.indigo,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ],
          ),
        ),
        if (_showResults && _searchResults.isNotEmpty)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final marker = _searchResults[index];
                return ListTile(
                  leading: Icon(
                    Icons.pin_drop,
                    color: DensityInfo.getLineColor(marker.lineColorType),
                  ),
                  title: Text(marker.name),
                  subtitle: Text('สาย ${marker.line}'),
                  onTap: () => _navigateToMarker(marker),
                );
              },
            ),
          ),
      ],
    );
  }
}