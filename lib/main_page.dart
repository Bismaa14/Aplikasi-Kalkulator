import 'package:flutter/material.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/page/bmi_page.dart';
import 'package:flutter_application_3/page/dashboard_page.dart';
import 'package:flutter_application_3/page/kalkulator_page.dart';
import 'package:flutter_application_3/page/massa_page.dart';
import 'package:flutter_application_3/page/panjang_page.dart';
import 'package:flutter_application_3/page/suhu_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Kalkulator'),
        actions: [
          IconButton(
            icon: Icon(Icons.calculate),
            onPressed: () {
              Navigator.pushNamed(context, '/kalkulator');
            },
          ),
        ],
      ),
      body: <Widget>[
        Container(
          child: DashboardPage(),
        ),
        Container(
          child: MassaPage(), // Gantilah dengan widget halaman Kalkulator Massa yang telah Anda buat
        ),
        Container(
          child: SuhuPage(),
        ),
        Container(
          child: PanjangPage(), // Gantilah dengan widget halaman Kalkulator Panjang yang telah Anda buat
        ),
        Container(
          child: BmiPage(),
        ),
        Container(
          child: kalkulatorPage(),
        )
      ][_selectedIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_weight),
            label: 'Kalkulator Massa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Kalkulator Panjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_outlined),
            label: 'Kalkulator Suhu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_weight),
            label: 'Kalkulator Suhu',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {         
          setState(() {
            _selectedIndex =index;
          });
        },
      ),
      
    );
  }
}