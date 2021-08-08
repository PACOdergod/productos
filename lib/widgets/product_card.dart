import 'package:flutter/material.dart';
import 'package:productos_app/main.dart';
import 'package:productos_app/models/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key, 
    required this.product
  }) : super(key: key);

  final Product product;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // height: 350,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 7)
          )
        ]
      ),

      child: Stack(
        children: [

          _BackImage(product.picture),

          Positioned(
            child: _Description(
              name: product.name,
              price: product.price,
              cantidad: product.cantidad,
            ),
            bottom: 0,
          )

        ],
      ),
    );
  }

}

class _Description extends StatelessWidget {
  _Description({
    Key? key, 
    required this.name, 
    required this.price,
    required this.cantidad,
  }) : super(key: key);

  final String name;
  final double price;
  final int cantidad;

  late final Color backColor;

  @override
  Widget build(BuildContext context) {


    if ( cantidad > 5 ) backColor = Colors.green;
    else if( cantidad > 0 ) backColor = Colors.yellow.shade600;
    else if( cantidad==0 ) backColor = Colors.red;

    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width-40,

      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )
      ),
      
      child: Row(
        children: [
          _Name( this.name ),
          _Price( this.price ),
        ],
      ),

    );
  }
}

class _Name extends StatelessWidget {
  const _Name(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ( MediaQuery.of(context).size.width-40 )/2 + 50,
      alignment: Alignment.center,

      child: Text( this.name,
        style: TextStyle( 
          color: Colors.white, 
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _Price extends StatelessWidget {
  const _Price(this.price);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ( MediaQuery.of(context).size.width-40 )/2 - 50,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),

      child: FittedBox(
        fit: BoxFit.contain,
        child: Text( '\$$price',
          style: TextStyle( 
            color: Colors.white, 
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _BackImage extends StatelessWidget {
  final String? urlImg;

  const _BackImage( this.urlImg );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 300
        ),

        child: urlImg==null
        ? Image.asset(MyAssets.noImage, fit: BoxFit.cover,)
        : FadeInImage(
          placeholder: AssetImage( MyAssets.loading ), 
          image: NetworkImage(this.urlImg!),
          fit: BoxFit.cover,
        )
      ),
    );
  }
}