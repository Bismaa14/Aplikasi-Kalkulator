import 'package:flutter/material.dart';

class MassaPage extends StatefulWidget {
  @override
  _MassaPageState createState() => _MassaPageState();
}

class _MassaPageState extends State<MassaPage> {
  double kilogram = 0;
  double hektogram = 0;
  double dekagram = 0;
  double gram = 0;
  double desigram = 0;
  double centigram = 0;
  double miligram = 0;

  void hitungKonversi() {
    final inputText = _controller.text;

    if (inputText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Masukkan nilai Kilogram terlebih dahulu.'),
      ));
      return;
    }

    final parsedValue = double.tryParse(inputText);

    if (parsedValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Masukkan bilangan desimal yang valid.'),
      ));
      return;
    }

    setState(() {
      kilogram = parsedValue;
      hektogram = kilogram * 10;
      dekagram = kilogram * 100;
      gram = kilogram * 1000;
      desigram = kilogram * 10000;
      centigram = kilogram * 100000;
      miligram = kilogram * 1000000;
    });
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Massa'),
        backgroundColor: Color.fromRGBO(76, 175, 80, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Konversi Massa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Masukkan Kilogram (Kg)',
                icon: Icon(Icons.line_weight),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                hitungKonversi();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, 
              ),
              child: Text('Hitung Konversi'),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil Konversi:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('$kilogram Kg = $hektogram hg'),
            Text('$kilogram Kg = $dekagram dag'),
            Text('$kilogram Kg = $gram g'),
            Text('$kilogram Kg = $desigram dg'),
            Text('$kilogram Kg = $centigram cg'),
            Text('$kilogram Kg = $miligram mg'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, 
              ),
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
