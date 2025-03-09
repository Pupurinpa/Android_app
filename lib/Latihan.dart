import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Flutter'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.lightBlue,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('A18.2024.00109'),
              Text('Moh. Aji Pamungkas B. U.'),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
                ),
              ),
              ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('Images/gundam.jpeg',
              width: 70,
              height: 70,),
              ),
              Image.asset(
              'Images/gundam.jpeg',
              width: 70,
              height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}