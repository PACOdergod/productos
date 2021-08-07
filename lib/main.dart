import 'package:flutter/material.dart';
import 'package:productos_app/pages/pages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      
      initialRoute: 'product',
      routes: {
        Rutas.login   : (_)=> LoginPage(),
        Rutas.loading : (_)=> LoadingPage(),
        Rutas.home    : (_)=> HomePage(),
        Rutas.product : (_)=> ProductPage()
      },

      theme: _myTema()

    );
  }

  ThemeData _myTema() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade300,

      colorScheme: ColorScheme.light(
        primary: Colors.green,
        primaryVariant: Colors.green.shade300,
      ),
      primaryColor: Colors.green,

      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.teal
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.pink,
        elevation: 0
      )
    );
  }
}

class Rutas {
  static String home = 'home';
  static String loading = 'loading';
  static String product = 'product';
  static String login = 'login';
}

class MyAssets {
  static String loading = 'assets/jar-loading.gif';
  static String noImage = 'assets/no-image.png';
}