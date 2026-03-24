import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Карта')),
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
          //Блок поиска (черновик)
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.blue,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Поиск адреса...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          //Кнопка "Где я?"
          Positioned(
            bottom: 100,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                Text('Мое местоположение');
              },
              child: Icon(Icons.my_location),
            ),
          ),
          //Информация о дистанции
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Text('Дистанция: ...'),
            ),
          ),
        ],
      ),
    );
  }
}
