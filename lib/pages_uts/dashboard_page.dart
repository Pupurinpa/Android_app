import 'package:flutter/material.dart';
import 'list_page.dart';
import 'welcome_page.dart';
class DashboardPage extends StatelessWidget {
  final List<Map<String,dynamic>>menuItems=[
    {
      'title': 'Menu Utama',
      'icon': Icons.home
    },
    {
      'title': 'Transaksi Penjulan',
      'icon': Icons.account_balance_wallet
    },
    {
      'title': 'Galery Product',
      'icon': Icons.visibility_off
    },
    {
      'title': 'Struktur Organisasi',
      'icon': Icons.precision_manufacturing
    },
    {
      'title': 'Setting',
      'icon': Icons.settings_backup_restore
    },
    {
      'title': 'Tentang Kami',
      'icon': Icons.person
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
              if (item['title'] == 'Transaksi Penjulan') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListPage(),
                  ),
                );
                //Navigator.pop(context);
              }else if(item['title'] == 'Tentang Kami') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
              }else if(item['title'] == 'Galery Product') {
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