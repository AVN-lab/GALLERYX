import '../widgets/parking_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(
                47.0105,
                28.8638,
              ), // Координаты центра карты (Кишинёв)
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // URL шаблона для загрузки тайлов карты
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: const ParkingInfoCard(),
          ),
        ],
      ),
    );
  }
}
