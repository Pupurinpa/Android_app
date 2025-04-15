import 'package:flutter/material.dart';
import 'Pages/welcome_page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Obat Aji',
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.lightGreen),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}