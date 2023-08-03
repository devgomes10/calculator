import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


void main() => runApp(AppCalculator());

class AppCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(primarySwatch: Colors.pink),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
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
      Parser p = Parser();
      Expression exp = p.parse(_displayText);

      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      if (result.isFinite) {
        setState(() {
          _displayText = result.toString();
        });
      } else {
        setState(() {
          _displayText = 'Erro';
        });
      };
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
        title: Text(
          'Calculadora',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80, top: 30),
            child: Container(
              width: 350,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(40),
              ),
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Center(
                child: Text(
                  _displayText,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.pink,
                    width: 7,
                  )),
              width: 350,
              height: 320,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton('7', textColor: Colors.white),
                          _buildButton('8', textColor: Colors.white),
                          _buildButton('9', textColor: Colors.white),
                          _buildButton('+', textColor: Colors.white),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton('4', textColor: Colors.white),
                          _buildButton('5', textColor: Colors.white),
                          _buildButton('6', textColor: Colors.white),
                          _buildButton('-', textColor: Colors.white),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton('1', textColor: Colors.white),
                          _buildButton('2', textColor: Colors.white),
                          _buildButton('3', textColor: Colors.white),
                          _buildButton('*', textColor: Colors.white),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButton('0', textColor: Colors.white),
                          _buildButton('.', textColor: Colors.white),
                          _buildButton('C', textColor: Colors.white),
                          _buildButton('/', textColor: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: ElevatedButton(
              onPressed: _calculateResult,
              child: Text('Calcular', style: TextStyle(fontSize: 20)),
            ),
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
      child: Text(text, style: TextStyle(color: textColor, fontSize: 30)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
