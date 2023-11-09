import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PanjangPage extends StatefulWidget {
  @override
  _PanjangPageState createState() => _PanjangPageState();
}

class _PanjangPageState extends State<PanjangPage> {
  String _selectedStartUnit = 'Kilometer (km)';
  String _selectedEndUnit = 'Kilometer (km)';
  double? _inputValue;
  double? _result;

  final List<String> units = [
    'Kilometer (km)',
    'Hektometer (hm)',
    'Dekameter (dam)',
    'Meter (m)',
    'Desimeter (dm)',
    'Sentimeter (cm)',
    'Milimeter (mm)',
  ];

  TextEditingController inputController = TextEditingController();
  TextEditingController resultController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputController.addListener(_onInputChanged);
  }

  void _onInputChanged() {
    if (inputController.text.isNotEmpty) {
      _inputValue = double.tryParse(inputController.text);
      _convert();
    } else {
      _inputValue = null;
      _result = null;
    }
  }

  void _convert() {
    if (_inputValue != null) {
      double kmValue = 0.0;
      switch (_selectedStartUnit) {
        case 'Kilometer (km)':
          kmValue = _inputValue!;
          break;
        case 'Hektometer (hm)':
          kmValue = _inputValue! / 10;
          break;
        case 'Dekameter (dam)':
          kmValue = _inputValue! / 100;
          break;
        case 'Meter (m)':
          kmValue = _inputValue! / 1000;
          break;
        case 'Desimeter (dm)':
          kmValue = _inputValue! / 10000;
          break;
        case 'Sentimeter (cm)':
          kmValue = _inputValue! / 100000;
          break;
        case 'Milimeter (mm)':
          kmValue = _inputValue! / 1000000;
          break;
      }

      switch (_selectedEndUnit) {
        case 'Kilometer (km)':
          _result = kmValue;
          break;
        case 'Hektometer (hm)':
          _result = kmValue * 10;
          break;
        case 'Dekameter (dam)':
          _result = kmValue * 100;
          break;
        case 'Meter (m)':
          _result = kmValue * 1000;
          break;
        case 'Desimeter (dm)':
          _result = kmValue * 10000;
          break;
        case 'Sentimeter (cm)':
          _result = kmValue * 100000;
          break;
        case 'Milimeter (mm)':
          _result = kmValue * 1000000;
          break;
      }

      resultController.text = _result!.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Panjang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: _selectedStartUnit,
              items: units.map((unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedStartUnit = value!;
                  _convert();
                });
              },
            ),
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
              decoration: InputDecoration(labelText: 'Masukkan Nilai'),
            ),
            DropdownButton<String>(
              value: _selectedEndUnit,
              items: units.map((unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedEndUnit = value!;
                  _convert();
                });
              },
            ),
            TextField(
              controller: resultController,
              keyboardType: TextInputType.number,
              enabled: false,
              decoration: InputDecoration(labelText: 'Hasil Konversi'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PanjangPage(),
  ));
}
