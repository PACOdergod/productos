import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/main.dart';
import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);

    if (productService.isLoading) return LoadingPage();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        actions: [
          IconButton(
            onPressed: ()=> Navigator.pushNamed(context, Rutas.product),
            icon: Icon(Icons.add),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Productos'),
              onTap: (){
                 Navigator.pop(context); // close the drawer
                 Navigator.pushReplacementNamed(context, Rutas.home);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Mis productos'),
              onTap: (){
                 Navigator.pop(context); // close the drawer
                 Navigator.pushReplacementNamed(context, Rutas.home);
              },
            ),

          ],
        ),
      ),

      body:ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: ( BuildContext context, int index ) {

          return GestureDetector(
            child: ProductCard(
              product: productService.products[index],
            ),
            //TODO: crear la pagina de descripcion
            onTap: (){
              productService.selectedProduct = 
                productService.products[index].copy();
              Navigator.pushNamed(context, Rutas.product);
            }
          );
          
        },
      ),

   );
  }
}