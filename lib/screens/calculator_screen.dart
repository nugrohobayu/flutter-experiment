import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Kalkulator'),
          Container(
            height: 500,
            child: SimpleCalculator(
              value: 123.45,
              hideExpression: true,
              onChanged: (key, value, eSxpression) {
                print('vall $key');
                print('vall $value');
                print('vall $eSxpression');
              },
              theme: const CalculatorThemeData(
                displayColor: Colors.white,
                displayStyle: TextStyle(fontSize: 80, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
