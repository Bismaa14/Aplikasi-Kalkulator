import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Tambahkan logika inisialisasi di sini, jika diperlukan.

    // Contoh penggunaan Future.delayed untuk simulasi splash screen selama 2 detik.
    Future.delayed(Duration(seconds: 3), () {
      // Navigasi ke halaman utama setelah splash screen selesai.
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Menggunakan Image.asset untuk menampilkan gambar dari asset.
            Image.asset('assets/logo.jpg', width: 100, height: 100), // Sesuaikan path dengan lokasi gambar Anda.
            SizedBox(height: 16),
            Text(
              'Aplikasi Kalkulator',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
