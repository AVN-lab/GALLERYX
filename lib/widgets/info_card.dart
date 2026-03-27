import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.9), blurRadius: 10),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Информация о маршруте',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Icon(Icons.directions_walk, color: Colors.blue),
              SizedBox(width: 8),
              Expanded(child: Text('Улица Пушкина, дом Колотушкина, Кишинев')),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Дистанция: Доебени'), Text('Время: Дохуя')],
          ),

          const SizedBox(height: 10),

          ElevatedButton(onPressed: () {}, child: Text('Я сказал стартуем!')),
        ],
      ),
    );
  }
}
