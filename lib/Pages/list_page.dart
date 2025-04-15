import 'package:flutter/material.dart';
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "A18.2024.000109-Moh. Aji Pamungkas Bachrul Ullum",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child:ListView(
          children: [
            ListTile(
              title:Text('Paracetamol'),
              leading: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('Paracetamol selected');
              },
            ),
            ListTile(
              title:Text('Ibuprofen'),
              leading: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('Ibuprofen selected');
              },
            ),
            ListTile(
              title:Text('Piroxicam'),
              leading: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('Piroxicam selected');
              },
            ),
            ListTile(
              title:Text('Tramadol'),
              leading: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('Tramadol selected');
              },
            ),
            ListTile(
              title:Text('Buscopan'),
              leading: Image.asset(
                'Images/gundam.jpeg',
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('Buscopan selected');
              },
            ),
          ],
        ),
      ),
    );
  }
}