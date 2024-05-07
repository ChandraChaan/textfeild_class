import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CompoundInterestCalculator(),
    );
  }
}

class CompoundInterestCalculator extends StatefulWidget {
  @override
  _CompoundInterestCalculatorState createState() =>
      _CompoundInterestCalculatorState();
}

class _CompoundInterestCalculatorState
    extends State<CompoundInterestCalculator> {
  late Map<String, dynamic> _config;

  late double _principal = 0.0;
  late double _rate = 1.0; // Initialize with some default value
  late int _compoundsPerYear = 1; // Initialize with some default value
  late int _years = 1; // Initialize with some default value
  late double _result = 0.0; // Initialize with some default value

  TextEditingController _principalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  void _loadConfig() {
    String jsonString = '''
      {
        "principal": {
          "hintText": "Enter principal amount",
          "textColor": "0XFF5E5A80",
          "textSize": 26.0,
          "minAmount": {
            "1": 10000,
            "2": 50000,
            "3": 75000
          },
          "maxAmount": 10000000,
          "errorMsg": "Amount must be between 10000 and 10000000"
        },
        "rate": {
          "textColor": "#000000",
          "textSize": 56,
          "labelText": "Rate of Interest",
          "values": {
            "1": "1%",
            "2": "2%",
            "3": "3%",
            "4": "4%",
            "5": "5%",
            "6": "6%",
            "7": "7%",
            "8": "8%",
            "9": "9%",
            "10": "10%",
            "11": "11%",
            "12": "12%",
            "13": "13%",
            "14": "14%",
            "15": "15%"
          }
        },
        "compounds": {
          "labelText": "No. of times compounded in a year",
          "textColor": "#000000",
          "textSize": 56,
          "values": {
            "1": "1",
            "2": "2",
            "3": "4"
          }
        },
        "years": {
          "labelText": "No. of years",
          "textColor": "#000000",
          "textSize": 56,
          "values": {
            "1": "1",
            "2": "2",
            "3": "3",
            "4": "4",
            "5": "5",
            "6": "6",
            "7": "7",
            "8": "8",
            "9": "9",
            "10": "10",
            "11": "11",
            "12": "12",
            "13": "13",
            "14": "14",
            "15": "15",
            "16": "16",
            "17": "17",
            "18": "18",
            "19": "19",
            "20": "20",
            "21": "21",
            "22": "22",
            "23": "23",
            "24": "24",
            "25": "25",
            "26": "26",
            "27": "27",
            "28": "28",
            "29": "29",
            "30": "30"
          }
        },
        "output": {
          "textColor": "#000000",
          "labelText": "Result",
          "textSize": 16
        }
      }
    ''';

    _config = jsonDecode(jsonString);
  }

  double _calculateCompoundInterest() {
    double A = _principal *
        pow(1 + (_rate / 100) / _compoundsPerYear, _compoundsPerYear * _years);
    return A;
  }

  Widget _buildTextField(
      {required String fieldName,
      required String hintText,
      String? color,
      double? size}) {
    return TextField(
      controller: _principalController,
      keyboardType: TextInputType.number,
      style: TextStyle(
          fontSize: size,
          color: color != null ? Color(int.parse(color.toString())) : null),
      decoration: InputDecoration(
        hintText: hintText,
      ),
      onChanged: (value) {
        setState(() {
          _principal = double.parse(value);
        });
      },
    );
  }

  Widget _buildDropdown(String fieldName, String labelText,
      Map<String, dynamic> values, String? color, double? size) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelStyle: TextStyle(
            fontSize: size,
            color: color != null ? Color(int.parse(color.toString())) : null),
        labelText: labelText,
      ),
      value: values.keys.first,
      items: values.entries
          .map<DropdownMenuItem<String>>((e) =>
              DropdownMenuItem<String>(value: e.key, child: Text(e.value)))
          .toList(),
      onChanged: (String? value) {
        setState(() {
          switch (fieldName) {
            case "rate":
              _rate = double.parse(value!);
              break;
            case "compounds":
              _compoundsPerYear = int.parse(value!);
              break;
            case "years":
              _years = int.parse(value!);
              break;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compound Interest Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
                fieldName: 'principal',
                hintText: _config["principal"]["hintText"],
                color: _config["principal"]["textColor"],
                size: _config["principal"]["textSize"]),
            const SizedBox(height: 20),
            _buildDropdown(
              "rate",
              _config["rate"]["labelText"],
              _config["rate"]["values"].cast<String, dynamic>(),
              _config["principal"]["textColor"],
              _config["principal"]["textSize"],
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              "compounds",
              _config["compounds"]["labelText"],
              _config["compounds"]["values"].cast<String, dynamic>(),
              _config["principal"]["textColor"],
              _config["principal"]["textSize"],
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              "years",
              _config["years"]["labelText"],
              _config["years"]["values"].cast<String, dynamic>(),
              _config["principal"]["textColor"],
              _config["principal"]["textSize"],
            ),
            const SizedBox(height: 20),
            Text(
              "Result: $_result",
              style: TextStyle(
                color: HexColor(_config["output"]["textColor"]),
                fontSize: _config["output"]["textSize"],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _result = _calculateCompoundInterest();
          });
        },
        child: const Icon(Icons.calculate),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
