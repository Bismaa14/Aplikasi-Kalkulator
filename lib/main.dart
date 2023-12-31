import 'package:flutter/material.dart';
import 'package:flutter_application_3/routes.dart'; 
import 'package:flutter_application_3/main_page.dart';

void main() {
  runApp(const MyApp());
  runApp(MaterialApp(initialRoute: '/splash',onGenerateRoute: Routes.generateRoute,),);
  runApp(
    MaterialApp(
      initialRoute: '/splash',
      onGenerateRoute: Routes.generateRoute,
      home: MainPage(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash', // Rute awal (splash screen)
      onGenerateRoute: Routes.generateRoute,
home: Navigator(
  initialRoute: '/splash',
  onGenerateRoute: (RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          body: MainPage(), // Halaman utama
            );
            },
          );
        },
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
