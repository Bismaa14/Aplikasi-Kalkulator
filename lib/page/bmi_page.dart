import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi dalam cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat Badan dalam kg',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
                onPrimary: Colors.white,
              ),
              onPressed: calculateBMI,
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 15),
            Text(
              _result == 0.0 ? "Masukan Nilai" : "BMI: ${_result.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              _result == 0.0
                  ? ""
                  : _result < 18.5
                      ? "Underweight"
                      : _result < 24.9
                          ? "Normal"
                          : _result < 29.9
                              ? "Overweight"
                              : "Obese",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    setState(() {
      _result = result;
    });
  }
}
