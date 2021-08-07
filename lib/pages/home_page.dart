import 'package:flutter/material.dart';
import 'package:productos_app/main.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body:ListView.builder(
        itemCount: 10,
        itemBuilder: ( BuildContext context, int index ) {

          return GestureDetector(
            child: ProductCard(),
            //TODO: crear la pagina de descripcion
            onTap: ()=> Navigator.pushNamed(context, Rutas.product),
          );
          
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> Navigator.pushNamed(context, Rutas.product),
      ),

   );
  }
}