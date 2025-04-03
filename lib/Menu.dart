import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A18.2024.00109 - Moh. Aji Pamungkas Bachrul Ullum'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child:GridView.count(
            crossAxisCount: 3,
            children: List.generate(9, (index){
              return Card(
                color: Colors.blue,
                margin:EdgeInsets.all(8.0),
                child:InkWell(
                  onTap:(){
                    print('Menu ${index+1} Selected');
                  },
                  child:Center(
                    child:Text(
                      'Menu ${index+1}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );
  }
}