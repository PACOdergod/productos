import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/pages/pages.dart';
 
void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductService() )
      ],
      child: MyApp(),
    );
  }
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      
      initialRoute: Rutas.myProducts,
      routes: {
        Rutas.login   : (_)=> LoginPage(),
        Rutas.loading : (_)=> LoadingPage(),
        Rutas.loadingProduct : (_)=> LoadingProductPage(),
        Rutas.home    : (_)=> HomePage(),
        Rutas.product : (_)=> ProductPage(),
        Rutas.myProducts : (_)=> MyProductsPage() 
      },

      theme: _myTema

    );
  }
}

var _myTema = ThemeData(
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


class Rutas {
  static String home = 'home';
  static String loading = 'loading';
  static String loadingProduct = 'loadingProduct';
  static String product = 'product';
  static String login = 'login';
  static String myProducts = 'myProducts';
}

class MyAssets {
  static String loading = 'assets/jar-loading.gif';
  static String noImage = 'assets/no-image.png';
}