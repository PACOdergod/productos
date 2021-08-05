import 'package:flutter/material.dart';
import 'package:productos_app/pages/pages.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      
      initialRoute: 'home',
      routes: {
        'login': (_)=> LoginPage(),
        'home':  (_)=> HomePage(),
        'loading': (_)=> LoadingPage(),
        'product': (_)=> ProductPage()
      },

      theme: MyThemeData.principal()
    );
  }
}

class MyThemeData {

  static ThemeData principal()=> 
  ThemeData(
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