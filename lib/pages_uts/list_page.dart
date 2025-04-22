import 'package:flutter/material.dart';
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Daftar Buah Buahan",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: ListTile(
          title: Text('Alpukat'),
          leading: Image.asset(
            'Images/alpukat.jpeg',
            width: 50,
            height: 50,
          ),
          onTap: () {
            print('Alpukat selected');
          },
              ),
            ),
            Card(
              child: ListTile(
          title: Text('Kiwi'),
          leading: Image.asset(
            'Images/kiwi.jpeg',
            width: 50,
            height: 50,
          ),
          onTap: () {
            print('Kiwi selected');
          },
              ),
            ),
            Card(
              child: ListTile(
          title: Text('Manggis'),
          leading: Image.asset(
            'Images/manggis.jpeg',
            width: 50,
            height: 50,
          ),
          onTap: () {
            print('Manggis selected');
          },
              ),
            ),
            Card(
              child: ListTile(
          title: Text('Strawberry'),
          leading: Image.asset(
            'Images/Mikan.jpeg',
            width: 50,
            height: 50,
          ),
          onTap: () {
            print('Strawberry selected');
          },
              ),
            ),
            Card(
              child: ListTile(
          title: Text('Pisang'),
          leading: Image.asset(
            'Images/pisang.jpg',
            width: 50,
            height: 50,
          ),
          onTap: () {
            print('Pisang selected');
          },
              ),
            ),
            Card(
              child: ListTile(
          title: Text('Salak'),
          leading: Image.asset(
            'Images/salak.jpg',
            width: 50,
            height: 50,
          ),
          onTap: () {
            print('Salak selected');
          },
              ),
            ),
          ],
        ),
      ),
    );
  }
}