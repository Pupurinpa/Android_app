import 'package:flutter/material.dart';
import 'dashboard_page.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Toko Obat Aji'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('Images/gundam.jpeg'),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to Toko Obat Aji',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                   Navigator.push(
                  context,
                 MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
          child: Text('Go to Dashboard'),
        ),
              Text(
                'Your one-stop shop for all your medication needs.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}