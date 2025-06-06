import 'package:flutter/material.dart';
import 'package:psu_bus/mockData/mock_data.dart';
import 'package:psu_bus/models/butStopModels.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:psu_bus/theme/app_colors.dart';

class BusSearchBar extends StatefulWidget {
  final Function(LatLng) onSelected; // callback ส่งตำแหน่ง marker ที่เลือก

  const BusSearchBar({super.key, required this.onSelected});

  @override
  State<BusSearchBar> createState() => _BusSearchBarState();
}

class _BusSearchBarState extends State<BusSearchBar> {
  final TextEditingController _controller = TextEditingController();
  List<BusStop> _searchResults = [];
  bool _showResults = false;

  void _search(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _showResults = false;
      });
      return;
    }

    final results = busStopDatabase.where((stop) =>
      stop.name.toLowerCase().contains(query.toLowerCase())).toList();

    setState(() {
      _searchResults = results;
      _showResults = true;
    });
  }

  void _selectBusStop(BusStop stop) {
    widget.onSelected(LatLng(stop.latitude, stop.longitude));
    setState(() {
      _controller.text = stop.name;
      _showResults = false;
      _searchResults = [];
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
                    color: AppColors.deepBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "ค้นหาป้ายรถเมล์...",
                      hintStyle: TextStyle(color: Colors.black45),
                      border: InputBorder.none,
                    ),
                    onChanged: _search,
                    onTap: () {
                      if (_searchResults.isNotEmpty) {
                        setState(() => _showResults = true);
                      }
                    },
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black54, size: 30),
                onPressed: () => _search(_controller.text),
              ),
              IconButton(
                icon: const Icon(
                  Icons.account_circle,
                  color: AppColors.deepBlue,
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
                final stop = _searchResults[index];
                return ListTile(
                  leading: Icon(Icons.pin_drop, color: AppColors.deepBlue),
                  title: Text(stop.name),
                  subtitle: Text('สาย ${stop.lineLabel}'),
                  onTap: () => _selectBusStop(stop),
                );
              },
            ),
          ),
      ],
    );
  }
}