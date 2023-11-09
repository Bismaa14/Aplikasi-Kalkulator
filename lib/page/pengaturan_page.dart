import 'package:flutter/material.dart';

class PengaturanPage extends StatefulWidget {
  @override
  _PengaturanPageState createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
                
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 243, 33, 33),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
