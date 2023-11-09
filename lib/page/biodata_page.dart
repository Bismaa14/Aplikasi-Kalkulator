import 'package:flutter/material.dart';

class BiodataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Developer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/profile_picture.ppg'), // Ganti dengan path gambar profil Anda
            ),
            SizedBox(height: 20),
            Text(
              'Bathara Bisma Saputra', // Ganti dengan nama lengkap Anda
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Mahasiswa', // Ganti dengan pekerjaan Anda
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            BiodataItem(label: 'Tanggal Lahir', value: '14 Maret 2003'), // Isi dengan tanggal lahir Anda
            BiodataItem(label: 'Alamat', value: 'Jl. Cibatu Mulya Raya No. 10-b, Kota Bandung'), // Isi dengan alamat Anda
            BiodataItem(label: 'Jenis Kelamin', value: 'Laki-laki'), // Isi dengan jenis kelamin Anda
            BiodataItem(label: 'Agama', value: 'Islam'), // Isi dengan agama Anda
            BiodataItem(label: 'Kewarganegaraan', value: 'Indonesia'), // Isi dengan kewarganegaraan Anda
            BiodataItem(label: 'Pendidikan Terakhir', value: 'Sarjana Informatika'), // Isi dengan pendidikan terakhir Anda
          ],
        ),
      ),
    );
  }
}

class BiodataItem extends StatelessWidget {
  final String label;
  final String value;

  BiodataItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: BiodataPage(),
    ));
