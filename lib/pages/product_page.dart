import 'package:flutter/material.dart';
import 'package:productos_app/main.dart';

class ProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Nuevo porducto'),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: (){}, 
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
      
            _ProductImage(),

            _Campos()
      
          ],
        ),
      )
    );
  }

}

class _Campos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var boxDecoration = BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
        width: 2
      ),
      borderRadius: BorderRadius.circular(15),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        child: Column(
          children: [

            SizedBox(
              height: 10,
            ),

            Container(
              decoration: boxDecoration,
              padding: EdgeInsets.symmetric(horizontal: 10),

              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Produto', 
                  hintText: 'Nombre', 
                ),
              ),
            ),

            SizedBox( height: 10 ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  decoration: boxDecoration,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: (MediaQuery.of(context).size.width-40)/2 -10,

                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Precio', 
                      hintText: '\$99', 
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                Container(
                  decoration: boxDecoration,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: (MediaQuery.of(context).size.width-40)/2 -10,

                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Cantidad', 
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

              ],
            ),

            SizedBox( height: 30 ),

            MaterialButton(
              child: Text('Guardar'),
              color: Theme.of(context).colorScheme.secondary,
              elevation: 0,
              onPressed: (){
                //TODO: guardar producto
              }
            )

          ],
        )
      ),
    );

  }
}

class _ProductImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height*0.4,
      width: double.infinity,
      color: Colors.white,

      child: FadeInImage(
        placeholder: AssetImage( MyAssets.loading ), 
        image: NetworkImage('https://via.placeholder.com/400x300'),
        fit: BoxFit.cover,
      ),
    );
  }
}