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
        backgroundColor: Colors.blue,
        title: Text(
          "A18.2024.000109-Moh. Aji Pamungkas Bachrul Ullum",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child:ListView(
          children: [
            ListTile(
              title:Text('Karna'),
              leading: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('Karna selected');
              },
            ),
            ListTile(
              title:Text('Gatot Kaca'),
              leading: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('Gatot Kaca selected');
              },
            ),
            ListTile(
              title:Text('Arjuna'),
              leading: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('Arjuna selected');
              },
            ),
            ListTile(
              title:Text('Wisanggeni'),
              leading: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('Wisanggeni selected');
              },
            ),
            ListTile(
              title:Text('Werkudara'),
              leading: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('Werkudara selected');
              },
            ),
          ],
        ),
      ),
    );
  }
}