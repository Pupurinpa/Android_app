import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity Switcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ActivityOne(),
    );
  }
}

class ActivityOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A18.2024.00109'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ActivityTwo()),
            );
          },
          child: Text('Activity Dua'),
        ),
      ),
    );
  }
}

class ActivityTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moh. Aji Pamungkas Bachrul Ullum'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Activity Satu'),
        ),
      ),
    );
  }
}