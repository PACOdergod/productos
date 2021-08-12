import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:image_picker/image_picker.dart';

import 'package:productos_app/main.dart';
import 'package:productos_app/models/product.dart';
import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/services.dart';

class ProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context, listen: false);
    
    return ChangeNotifierProvider(
      create: (_)=> ProductFormProvider(productService.selectedProduct),
      child: _ProductPageBody(),
    );
  }

}

class _ProductPageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);

    return Scaffold(

      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () async {
              final _picker = new ImagePicker();
              var _pickedFile = await _picker.pickImage(
                source: ImageSource.camera,
                imageQuality: 100
              );

              if (_pickedFile == null) return;

              productService.updateProductImage(_pickedFile.path);

              _pickedFile = null;
              
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
      
            _ProductImage(productService.selectedProduct.picture),

            _Campos(),

            SizedBox( height: 20 ),

            _Guardar(),

            SizedBox( height: 20 ),
      
          ],
        ),
      )
    );
  }
}

class _Campos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: productForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [

            SizedBox( height: 10 ),

            _Nombre( product: product),

            SizedBox( height: 10 ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                _Precio( product: product),

                _Cantidad( product: product),

              ],
            ),
          ],
        )
      ),
    );

  }
}

BoxDecoration _cajaDeco(BuildContext context)=>
  BoxDecoration(
    border: Border.all(
      color: Theme.of(context).colorScheme.primary,
      width: 2
    ),
    borderRadius: BorderRadius.circular(15),
    color: Colors.white,
  );

class _Nombre extends StatelessWidget {
  const _Nombre({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cajaDeco(context),
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
    );
  }
}

class _Precio extends StatelessWidget {
  const _Precio({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cajaDeco(context),
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
    );
  }
}

class _Cantidad extends StatelessWidget {
  const _Cantidad({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cajaDeco(context),
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
      onPressed: () async {
        if (!productForm.isValid()) return;

        Navigator.pushNamed(context, Rutas.loadingProduct);
        
        final imageUrl = await productService.uploadImage();
        if(imageUrl != null) productForm.product.picture = imageUrl;

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
      child: getImage(urlImg)
    );
  }
}

getImage(String? url){

  if (url == null)
    return Image.asset(MyAssets.noImage, fit: BoxFit.cover);

  if(url.startsWith('http'))
    return FadeInImage(
      placeholder: AssetImage( MyAssets.loading ), 
      image: NetworkImage(url),
      fit: BoxFit.cover,
    );
  
  return Image.file(
    File(url),
    fit: BoxFit.cover,
  );
}