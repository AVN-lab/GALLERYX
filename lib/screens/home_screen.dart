import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'map_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Фон
          SizedBox.expand(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover, //Растягиваем изображение на весь экран
            ),
          ),

          //Кнопка 1 (сверху слева)
          CustomButton(
            text: 'Может, Кря',
            top: 50,
            left: 20,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Аааааа'),
                  content: Text('Нет, не Кря!'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Ок'),
                    ),
                  ],
                ),
              );
            },
          ),
          //Кнопка 2 (сверху справа)
          CustomButton(
            text: 'Может, Ква',
            top: 50,
            left: 360,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Аааааа'),
                  content: Text('Нет, не Ква!'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Ок'),
                    ),
                  ],
                ),
              );
            },
          ),
          //Кнопка 3 (снизу слева)
          CustomButton(
            text: 'Может, Чык-чырык',
            top: 600,
            left: 20,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Аааааа'),
                  content: Text('Нет, не Чык-чырык!'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Ок'),
                    ),
                  ],
                ),
              );
            },
          ),
          //Кнопка 4 (снизу справа)
          CustomButton(
            text: 'Может, Мяу',
            top: 600,
            left: 360,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapScreen()),
              );
            },
          ),

          Center(
            child: Text(
              'Допустим, ГАВ',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
