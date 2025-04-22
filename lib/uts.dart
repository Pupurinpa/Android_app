import 'package:flutter/material.dart';
import 'pages_uts/dashboard_page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Buah Aji',
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.lightGreen),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}