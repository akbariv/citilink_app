import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;

  void tekanTombol() {
    setState(() {
      number = number + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            number.toString(),
            style: TextStyle(fontSize: 10 + number.toDouble()),
          ),
          ElevatedButton(
            onPressed: tekanTombol,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, 
              backgroundColor: Colors.blue, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
            ),
            child: const Text('Tambah Bilangan'),
          ),
        ],
      )),
    ));
  }
}
