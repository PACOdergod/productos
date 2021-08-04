import 'package:flutter/material.dart';
import 'package:productos_app/pages/pages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      
      initialRoute: 'login',
      routes: {
        'login': (_)=> LoginPage(),
        'home':  (_)=> HomePage(),
        'loading': (_)=> LoadingPage()
      },

      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade300
      ),
    );
  }
}