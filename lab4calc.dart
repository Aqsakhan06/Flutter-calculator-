import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String input = '';

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
      } else if (value == '=') {
        try {
          input = (double.parse(input)).toString();
        } catch (e) {
          input = 'Error';
        }
      } else {
        input += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Calculator')),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                input,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () => buttonPressed(_getButtonLabel(index)),
                    child: Text(
                      _getButtonLabel(index),
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getButtonLabel(int index) {
    const buttons = [
      '7',
      '8',
      '9',
      '/',
      '4',
      '5',
      '6',
      'x',
      '1',
      '2',
      '3',
      '-',
      'C',
      '0',
      '=',
      '+',
    ];
    return buttons[index];
  }
}
