import 'package:flutter/material.dart';
import 'list_page.dart';
class DashboardPage extends StatelessWidget {
  final List<Map<String,dynamic>>menuItems=[
    {
      'title': 'Obat',
      'icon': Icons.medical_services
    },
    {
      'title': 'Transaksi',
      'icon': Icons.shopping_cart
    },
    {
      'title': 'Laporan',
      'icon': Icons.insert_chart
    },
    {
      'title': 'Keluar',
      'icon': Icons.exit_to_app
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: menuItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return GestureDetector(
            onTap: () {
              if (item['title'] == 'Keluar') {
                Navigator.pop(context);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListPage(),
                  ),
                );
              }
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], size: 50, color: Colors.green),
                  SizedBox(height: 10),
                  Text(item['title'], style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}