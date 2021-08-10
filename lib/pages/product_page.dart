import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/providers/product_form_provider.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/main.dart';
import 'package:productos_app/services/services.dart';

class ProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context, listen: false);
    
    return ChangeNotifierProvider(
      create: (_)=> ProductFormProvider(productService.selectedProduct),
      child: _ProductPageBody(productService: productService),
    );
  }

}

class _ProductPageBody extends StatelessWidget {
  const _ProductPageBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductService productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Producto'),
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
      
            _ProductImage(productService.selectedProduct.picture),

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

    final productForm = Provider.of<ProductFormProvider>(context, listen: false);
    final product = productForm.product;

    var boxDecoration = BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
        width: 2
      ),
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: productForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [

            SizedBox( height: 10 ),

            Container(
              decoration: boxDecoration,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

              child: TextFormField(
                initialValue: product.name,
                onChanged: (value)=> product.name = value,
                validator: (value){
                  if(value==null || value.length<1) 
                    return 'El nombre es obligatorio';
                },
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: (MediaQuery.of(context).size.width-40)/2 -10,

                  child: TextFormField(
                    initialValue: product.price.toString(),
                    onChanged: (value){
                      if(double.tryParse(value) == null)product.price = 0;
                      else product.price = double.parse(value);
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}')
                      )
                    ],

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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: (MediaQuery.of(context).size.width-40)/2 -10,

                  child: TextFormField(
                    initialValue: product.cantidad.toString(),
                    onChanged: (value){
                      if(double.tryParse(value) == null)product.cantidad = 0;
                      else product.cantidad = int.parse(value);
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}')
                      )
                    ],

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

            _Guardar()

          ],
        )
      ),
    );

  }
}

class _Guardar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context, listen: false);
    final productService = Provider.of<ProductService>(context, listen: false);
    
    return MaterialButton(
      child: Text('Guardar'),
      color: Theme.of(context).colorScheme.secondary,
      elevation: 0,
      onPressed: (){
        if (!productForm.isValid()) return;

        productService.saveOrCreate(productForm.product);
      }
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage(this.urlImg);

  final String? urlImg;

  @override
  Widget build(BuildContext context) {

    return Container(
      
      width: double.infinity,
      color: Colors.white,

      child: urlImg==null
      ? Image.asset(MyAssets.noImage, fit: BoxFit.cover,)
      : FadeInImage(
        placeholder: AssetImage( MyAssets.loading ), 
        image: NetworkImage(this.urlImg!),
        fit: BoxFit.cover,
      )
      
    );
  }
}