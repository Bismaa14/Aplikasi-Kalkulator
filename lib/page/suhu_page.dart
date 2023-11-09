import 'package:flutter/material.dart';

class SuhuPage extends StatefulWidget {
  @override
  _SuhuPageState createState() => _SuhuPageState();
}

class _SuhuPageState extends State<SuhuPage> {
  double celsius = 0.0;
  double fahrenheit = 0.0;
  double kelvin = 0.0;

  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();
  TextEditingController kelvinController = TextEditingController();

  int currentController = 0; // 0: Celsius, 1: Fahrenheit, 2: Kelvin
  FocusNode celsiusFocus = FocusNode();
  FocusNode fahrenheitFocus = FocusNode();
  FocusNode kelvinFocus = FocusNode();

  void updateValues() {
    setState(() {
      try {
        celsius = double.parse(celsiusController.text);
        fahrenheit = (celsius * 9 / 5) + 32;
        kelvin = celsius + 273.15;

        fahrenheitController.text = fahrenheit.toStringAsFixed(2);
        kelvinController.text = kelvin.toStringAsFixed(2);
      } catch (e) {
        celsiusController.text = '';
        fahrenheitController.text = '';
        kelvinController.text = '';
      }
    });
  }

  void addNumber(String number) {
    var controller;
    var focus;
    if (currentController == 0) {
      controller = celsiusController;
      focus = celsiusFocus;
    } else if (currentController == 1) {
      controller = fahrenheitController;
      focus = fahrenheitFocus;
    } else if (currentController == 2) {
      controller = kelvinController;
      focus = kelvinFocus;
    }

    if (controller.text.length < 10) {
      controller.text += number;
      updateValues();
      focus.requestFocus();
    }
  }

  @override
  void initState() {
    super.initState();
    celsiusFocus.addListener(() {
      setState(() {
        currentController = 0;
      });
    });
    fahrenheitFocus.addListener(() {
      setState(() {
        currentController = 1;
      });
    });
    kelvinFocus.addListener(() {
      setState(() {
        currentController = 2;
      });
    });
  }

  @override
  void dispose() {
    celsiusFocus.dispose();
    fahrenheitFocus.dispose();
    kelvinFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: celsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Celsius'),
              onChanged: (value) {
                celsiusFocus.requestFocus();
                updateValues();
              },
              focusNode: celsiusFocus,
            ),
            SizedBox(height: 10),
            TextField(
              controller: fahrenheitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Fahrenheit'),
              onChanged: (value) {
                fahrenheitFocus.requestFocus();
                updateValues();
              },
              focusNode: fahrenheitFocus,
            ),
            SizedBox(height: 10),
            TextField(
              controller: kelvinController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Kelvin'),
              onChanged: (value) {
                kelvinFocus.requestFocus();
                updateValues();
              },
              focusNode: kelvinFocus,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                for (int i = 1; i < 10; i++)
                  ElevatedButton(
                    onPressed: () {
                      addNumber(i.toString());
                    },
                    child: Text(i.toString()),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
