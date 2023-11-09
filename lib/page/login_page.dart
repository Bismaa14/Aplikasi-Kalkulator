import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    String email = emailController.text;
    String password = passwordController.text;

    // Simulasi login dengan username "bisma" dan password "1234"
    if (email == 'bisma' && password == '1234') {
      Navigator.pushNamed(context, '/main');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Gagal'),
            content: Text('Email atau kata sandi tidak valid.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tutup'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromRGBO(33, 150, 243, 1), const Color.fromRGBO(76, 175, 80, 1)], // Ganti warna sesuai keinginan Anda
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    'Silakan Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
