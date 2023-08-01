import 'package:flutter/material.dart';

void main() => runApp(AppCalculator());

class AppCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayText = '';

  void _addToDisplay(String value) {
    setState(() {
      _displayText += value;
    });
  }

  void _clearDisplay() {
    setState(() {
      _displayText = '';
    });
  }

  void _calculateResult() {
    try {

    } catch (e) {
      setState(() {
        _displayText = 'Erro';
      });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Calculadora', style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _displayText,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          Divider(height: 1, color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('0'),
              _buildButton('.'),
              _buildButton('C', textColor: Colors.red),
              _buildButton('/', textColor: Colors.green),
            ],
          ),
          ElevatedButton(
            onPressed: _calculateResult,
            child: Text('Calcular', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, {Color textColor = Colors.black}) {
    return ElevatedButton(
      onPressed: () {
        if (text == 'C') {
          _clearDisplay();
        } else {
          _addToDisplay(text);
        }
      },
      child: Text(text, style: TextStyle(color: textColor, fontSize: 20)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
