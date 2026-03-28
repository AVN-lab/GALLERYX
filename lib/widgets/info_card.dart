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
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: const Color.fromARGB(255, 108, 108, 108),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Улица Пушкина, дом Колотушкина, Кишинев',
                  style: TextStyle(fontSize: 12),
                ),
              ),
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
