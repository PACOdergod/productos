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