import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class RouteMapWidget extends StatelessWidget {
  final List<LatLng> routePoints;

  const RouteMapWidget({required this.routePoints});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: routePoints.isNotEmpty ? routePoints.first : LatLng(0, 0),
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.yourapp',
        ),
        if (routePoints.isNotEmpty)
          PolylineLayer(
            polylines: [
              Polyline(
                points: routePoints,
                color: Colors.orange,
                strokeWidth: 4,
              ),
            ],
          ),
        if (routePoints.isNotEmpty)
          MarkerLayer(
            markers: [
              Marker(
                point: routePoints.first,
                width: 50,
                height: 50,
                child: const Icon(Icons.circle, color: Colors.green),
              ),
              Marker(
                point: routePoints.last,
                width: 50,
                height: 50,
                child: const Icon(Icons.location_pin, color: Colors.red),
              ),
            ],
          ),
      ],
    );
  }
}
