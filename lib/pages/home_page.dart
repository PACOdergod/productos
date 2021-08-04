import 'package:flutter/material.dart';
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
          return ProductCard();
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),

   );
  }
}