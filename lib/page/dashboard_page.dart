import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
      body: Center( // Menggunakan Center untuk menengahkan isi halaman
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selamat datang di Aplikasi Kalkulator!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/biodata');
              },
              child: Text('Biodata Saya'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/todo_list');
              },
              child: Text('To-Do List'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 243, 33, 33),
              ),
            ),
              SizedBox(height: 10),
              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pengaturan_page');
              },
              child: Text('Setting'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
